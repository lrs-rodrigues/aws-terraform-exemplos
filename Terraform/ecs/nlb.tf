resource "aws_lb" "loadbalancer" {
  internal = true
  load_balancer_type = "network"
  subnets = [aws_subnet.public-us-east-1a.id, aws_subnet.public-us-east-1b.id]

  enable_deletion_protection = false

  tags = {
    "Name" = "ecs-nlb"
    LoadBalancerType = "VPCLink"
    Environment = var.env
  }
}

resource "aws_lb_target_group" "loadbalancer" {
    port =  "443"
    protocol = "TCP"
    target_type = "instance"
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = "ecs-nlb-tg"
    }
}

resource "aws_lb_listener" "loadbalancer" {
    load_balancer_arn = aws_lb.loadbalancer.arn
    port = "443"
    protocol = "TCP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.loadbalancer.arn
    }
}



