resource "aws_autoscaling_group" "main" {
    name = "ecs-cluster-asg-${var.env}"
    vpc_zone_identifier = [
        aws_subnet.private-us-east-1a.id,
        aws_subnet.private-us-east-1b.id
    ]
    
    desired_capacity = 2
    min_size = 1
    max_size = 3
    health_check_grace_period = 300
    health_check_type         = "EC2"

    launch_configuration = aws_launch_configuration.launch.name

    tag {
      key                 = "AmazonECSManaged"
      value               = true
      propagate_at_launch = true
    }

     instance_refresh {
      strategy = "Rolling"
      preferences {
        min_healthy_percentage = 50
      }
    }

}

resource "aws_launch_configuration" "launch" {
    image_id = "ami-0cff7528ff583bf9a"
    iam_instance_profile = aws_iam_instance_profile.ecs-cluster-profile.name
    security_groups = [aws_security_group.security.id]
    user_data =  file("${path.module}/templates/user-data.sh")
    instance_type = "t2.micro"
}

