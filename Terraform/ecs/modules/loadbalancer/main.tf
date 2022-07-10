resource "aws_lb" "loadbalancer" {
  internal = var.loadbalancer_configs.internal
  load_balancer_type = var.loadbalancer_configs.load_balancer_type
  subnets = var.subnets_public

  enable_deletion_protection = var.loadbalancer_configs.enable_deletion_protection

  tags = {
    "Name" = var.loadbalancer_name
    LoadBalancerType = var.loadbalancer_configs.loadbalancer_type
    Environment = var.env
  }
}

resource "aws_lb_target_group" "loadbalancer" {
    port =  var.loadbalancer_target_group_config.port
    protocol = var.loadbalancer_target_group_config.protocol
    target_type = var.loadbalancer_target_group_config.target_type
    vpc_id = var.vpc_id

    tags = {
      "Name" = var.loadbalancer_target_group_config.target_group_name
    }
}

resource "aws_lb_listener" "loadbalancer" {
    load_balancer_arn = aws_lb.loadbalancer.arn
    port = var.loadbalancer_listener_config.port
    protocol = var.loadbalancer_listener_config.protocol

    default_action {
      type = var.loadbalancer_listener_config.type
      target_group_arn = aws_lb_target_group.loadbalancer.arn
    }
}



