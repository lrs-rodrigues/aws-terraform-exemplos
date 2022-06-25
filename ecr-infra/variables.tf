# https://www.terraform.io/language/expressions/types

variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "region" {
    type = string
    description = "Região da AWS"
    default = "us-east-1"
}


variable "fargate" {
    type = bool
    description = "FARGATE"
    default = false
}

variable "fargate_spot" {
    type = bool
    description = "Fargate Spot"
    default = false
}

variable "ec2_spot" {
    type = bool
    description = "EC2 Spot"
    default = false
}

variable "container_insights" {
    type = bool
    description = "EC2 Spot"
    default = false
}


variable "ecs_name" {
    type = string
    description = "Nome do Cluster do ECS"
}


variable "instance_profile_name" {
    type = string
    description = "Nome da role"
}


variable "instance_type" {
    type = string
    description = "Tipo da Instancia"
}

variable "desired_capacity" {
    type = number
    description = "Capacidade desejada"
}

variable "max_size" {
    type = number
    description = "Instancias maximas"
}

variable "min_size" {
    type = number
    description = "Instancias mínima"
}

variable "volume_size" {
    type = number
    description = "Espaço reservado"
}

variable "default_cooldown" {
    type = number
    description = "default_cooldown"
}


variable "rolling_healthy_percentage" {
    type = number
    description = "Percentual Mínimo de Tntegridade "
}

variable "vpc_id" {
    type = string
    description = "ID da VPC"
}

variable "private_subnets_cidr" {
    type = string
    description = "CIDR Privado"
}

variable "subnet_ids" {
    type = list
    description = "IDs das Subnets"
}

variable "start_schedule" {
    type = string
    description = "start_schedule"
    default =  ""
}

variable "stop_schedule" {
    type = string
    description = "start_schedule"
    default =  ""
}

variable "ScheduleAction" {
    type = bool
    description = "ScheduleAction"
    default = false
}







