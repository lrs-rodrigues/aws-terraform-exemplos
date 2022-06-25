resource "aws_lb_target_group" "loadbalancer" {
    name = "estudoterraform-tag"
    port = var.listner-container-port
    protocol = "TCP"
    target_type = "instance"
    vpc_id = var.vpc_id
}


resource "aws_lb" "loadbalancer" {
  name = "estudoterraform-nlb"
  internal = true
  load_balancer_type = "network"
  subnets = [var.subnet-1, var.subnet-2]

  enable_deletion_protection = false

  tags = {
    Environment = var.env
    LoadBalancerType = var.load-balancer-type
  }
}

resource "aws_lb_listener" "loadbalancer" {
    load_balancer_arn = aws_lb.loadbalancer.arn
    port = var.listner-container-port
    protocol = "TCP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.loadbalancer.arn
    }
}