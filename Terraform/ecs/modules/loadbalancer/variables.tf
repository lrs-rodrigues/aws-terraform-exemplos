variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "vpc_id" {
    type = string
    description = "VPC ID"
    default = "..."
}

variable "subnets_public" {
    type = list
    description = "Subnets Public"
    default = []
}

variable "loadbalancer_name" {
    type = string
    description = "LoadBalancer Name"
}

variable "loadbalancer_configs" {
    type = map
    description = "LoadBalancer Configs"
}

variable "loadbalancer_target_group_config" {
    type = map
    description = "LoadBalancer Target Group Configs"
}

variable "loadbalancer_listener_config" {
    type = map
    description = "LoadBalancer Listener Configs"
}
