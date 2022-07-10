
resource "aws_ecs_cluster" "main" {
    name = var.cluster_name
    capacity_providers = [aws_ecs_capacity_provider.capacity.name]
    
    tags = {
        Name = var.cluster_name
        Environment = var.env
    }
}

resource "aws_ecs_capacity_provider" "capacity" {
    name =  var.cluster_name
    

    auto_scaling_group_provider {
        auto_scaling_group_arn = var.auto_scaling_group_arn
        managed_termination_protection = var.cluster_group_provider_configs.managed_termination_protection

        managed_scaling {
            status = var.cluster_group_provider_configs.status
            target_capacity = var.cluster_group_provider_configs.target_capacity
        }
    }
    
    tags = {
        Name = var.cluster_name
        Environment = var.env
    }
}
