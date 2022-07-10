resource "aws_security_group" "security" {
    vpc_id = var.vpc_id

    ingress  {
      description = "Allow Traffic - Ingress"
      from_port = var.security_group_configs["ingress"].from_port
      to_port = var.security_group_configs["ingress"].to_port
      protocol = var.security_group_configs["ingress"].protocol
      cidr_blocks = var.security_group_configs["ingress"].cidr_blocks
    } 

    egress {
      description = "Allow Traffic - Egress"
      from_port = var.security_group_configs["egress"].from_port
      to_port = var.security_group_configs["egress"].to_port
      protocol = var.security_group_configs["egress"].protocol
      cidr_blocks = var.security_group_configs["egress"].cidr_blocks
      ipv6_cidr_blocks = var.security_group_configs["egress"].ipv6_cidr_blocks
    }

    tags = {
        "Name" = var.security_group_name
    }
}