variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "vpc_id" {
    type = string
    description = "VPC ID"
}

variable "security_group_name" {
    type = string
    description = "Security Group Name"
}

variable "security_group_configs" {
    type = map
    description = "Security Group Configs"
}