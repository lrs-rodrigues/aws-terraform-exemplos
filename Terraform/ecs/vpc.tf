# AWS VPC - https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/what-is-amazon-vpc.html
# VPC - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
    cidr_block = "172.31.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "ecs_vpc"
    }
}