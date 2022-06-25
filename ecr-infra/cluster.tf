
resource "aws_ecs_cluster" "main" {
  name = var.ecs_name
  capacity_providers = length(aws_ecs_capacity_provider.main) == 1 ? [aws_ecs_capacity_provider.main[0].name] : var.fargate_spot ? ["FARGATE_SPOT"] : []

  setting {
    name = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }
}

resource "aws_ecs_capacity_provider" "main" {
  count = var.fargate || var.fargate_spot ? 0 : 1
  name = var.ecs_name

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.main.arn
    managed_termination_protection = "DISABLED"

    managed_scaling {
      status = "ENABLED"
      target_capacity = 100
    }
  }
}