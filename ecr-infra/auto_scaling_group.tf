
resource "aws_autoscaling_group" "main" {
    name = var.ecs_name
    desired_capacity = var.desired_capacity
    max_size = var.max_size
    min_size = var.min_size
    vpc_zone_identifier = var.subnet_ids
    default_cooldown = var.default_cooldown

    dynamic "launch_template" {
      for_each = var.ec2_spot ? [1] : []

      content {
          id = aws_launch_template.main.id
          version = aws_launch_template.main.latest_version
      }
    }

    tag {
      key= "AmazonECSManaged"
      value = ""
      propagate_at_launch = true
    }
  
    instance_refresh {
      strategy = "Rolling"
      preferences {
        min_healthy_percentage = var.rolling_healthy_percentage
      }
    }

    depends_on = [
      aws_launch_template.main
    ]
}

data "template_file" "user_data" {
    template = file("${path.module}/templates/user-data.sh")

    vars = {
        cluster_name = var.ecs_name
    }
}

resource "aws_launch_template" "main" {
    name = var.ecs_name
    image_id = "ami-0cff7528ff583bf9a"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.security.id]
    user_data = base64encode(data.template_file.user_data.rendered)

    iam_instance_profile {
      name = "ecs-cluster-role"
    }

    block_device_mappings {
      device_name = "/dev/xvda"
      ebs {
        volume_size = var.volume_size
        encrypted = true
      }
    }

    tag_specifications {
      resource_type = "instance"

      tags = {
        Name = var.ecs_name
      }
    }
}

resource "aws_autoscaling_schedule" "scale_down" {
    count = var.ScheduleAction ? 1 : 0
    scheduled_action_name = "Terminate instances"
    min_size = 0
    max_size = 0
    desired_capacity = 0
    time_zone = "America/Sao_Paulo"
    recurrence = var.stop_schedule
    autoscaling_group_name = aws_autoscaling_group.main.name
}

resource "aws_autoscaling_schedule" "scale_up" {
    count = var.ScheduleAction ? 1 : 0
    scheduled_action_name = "Stratup instances"
    min_size = 1
    max_size = 2
    desired_capacity = 2
    time_zone = "America/Sao_Paulo"
    recurrence = var.start_schedule
    autoscaling_group_name = aws_autoscaling_group.main.name
}