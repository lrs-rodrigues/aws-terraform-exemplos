locals {
    subnets = {for key, val in var.subnets: key => val if val.public_ip == false}

    vpc_zone_identifier = [for key, value in local.subnets: "${aws_subnet.subnet[key].id}"]

    subnets_public = {for key, val in var.subnets: key => val if val.public_ip == true}
}

output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.main.id
}

output "vpc_zone_identifier" {
    description = "VPC Zone Identifier"
    value = local.vpc_zone_identifier
}

output "subnets_public" {
    description = "VPC Zone Identifier"
    value = [for key, value in local.subnets_public: "${aws_subnet.subnet[key].id}"]
}