
resource "aws_ecs_cluster" "main" {
    name = "cluster-${var.env}"
    capacity_providers = [aws_ecs_capacity_provider.capacity.name]
    
    tags = {
        Name = "cluster-${var.env}"
        Environment = var.env
    }
}

resource "aws_ecs_capacity_provider" "capacity" {
    name = "cluster-${var.env}"
    

    auto_scaling_group_provider {
        auto_scaling_group_arn = aws_autoscaling_group.main.arn
        managed_termination_protection = "DISABLED"

        managed_scaling {
         status = "ENABLED"
         target_capacity = 100
        }
    }
    
    tags = {
        Name = "cluster-${var.env}"
        Environment = var.env
    }
}
