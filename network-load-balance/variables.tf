

variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "region" {
    type = string
    description = "Região da AWS"
    default = "us-east-1"
}

variable "vpc_id" {
    type = string
    description = "ID da VPC"
}

variable "subnet-1" {
    type = string
    description = "Nome da Subnet 1"
}

variable "subnet-2" {
    type = string
    description = "Nome da Subnet 2"
}

variable "listner-container-port" {
    type = string
    description = "Porta do Container"
}

variable "load-balancer-type" {
    type = string
    description = "Tipo do Load Balancer"
}