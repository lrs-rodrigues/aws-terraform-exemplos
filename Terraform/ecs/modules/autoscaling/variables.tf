variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "vpc_zone_identifier" {
    type = list
    description = "VPC Zone Identifier (Subnets)"
}

variable "security_groups" {
    type = list
    description = "Security Groups"
}

variable "autoscaling_group_name" {
    type = string
    description = "Security Group Name"
}

variable "autoscaling_group_configs" {
    type = map
    description = "Autoscaling Group Configs"
}
