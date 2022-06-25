
resource "aws_security_group" "security" {
    name = var.ecs_name
    description = "Security Group"
    vpc_id = var.vpc_id

    tags = {
        Name = var.ecs_name
    }
}

resource "aws_security_group_rule" "security_internet_egress" {
    description = "Allow Traffic - Egress"
    protocol = "-1"
    security_group_id = aws_security_group.security.id
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    type = "egress"
}

resource "aws_security_group_rule" "security_internet_ingress" {
    description = "Allow Traffic - Ingress"
    protocol = "tcp"
    security_group_id = aws_security_group.security.id
    cidr_blocks = ["${var.private_subnets_cidr}"]
    from_port = 49153
    to_port = 65535
    type = "ingress"
}