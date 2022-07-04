resource "aws_security_group" "security" {
    vpc_id = aws_vpc.main.id

    ingress  {
      description = "Allow Traffic - Ingress"
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
      description = "Allow Traffic - Egress"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        "Name" = "ecs-cluster-security"
    }
}