variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "vpc_name" {
    type = string
    description = "VPC Name"
}

variable "vpc_cidr_block" {
    type = string
    description = "VPC CIDR Block"
}

variable "vpc_enable_dns_support" {
    type = bool
    default = true
}

variable "vpc_enable_dns_hostnames" {
    type = bool
    default = true
}

variable "subnets" {
    type = map
    description = "Subnets"
}

variable "igw_name" {
    type = string
    description = "Internet Gateway name"
}
