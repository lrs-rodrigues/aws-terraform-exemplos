resource "aws_autoscaling_group" "main" {
    name = var.autoscaling_group_name
    vpc_zone_identifier = var.vpc_zone_identifier
    
    desired_capacity = var.autoscaling_group_configs.desired_capacity
    min_size = var.autoscaling_group_configs.min_size
    max_size = var.autoscaling_group_configs.max_size
    health_check_grace_period = var.autoscaling_group_configs.health_check_grace_period
    health_check_type         = var.autoscaling_group_configs.health_check_type

    launch_configuration = aws_launch_configuration.launch.name

    tag {
      key                 = "AmazonECSManaged"
      value               = true
      propagate_at_launch = true
    }

     instance_refresh {
      strategy = var.autoscaling_group_configs.strategy
      preferences {
        min_healthy_percentage = var.autoscaling_group_configs.min_healthy_percentage
      }
    }

}

resource "aws_launch_configuration" "launch" {
    image_id = var.autoscaling_group_configs.image_id
    iam_instance_profile = aws_iam_instance_profile.autoscaling-iam-profile.name
    security_groups = var.security_groups
    user_data =  file("${path.module}/templates/user-data.sh")
    instance_type = var.autoscaling_group_configs.instance_type
}

