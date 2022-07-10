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
    description = "VPC ID"
    default = "..."
}

variable "vpc_zone_identifier" {
    type = list
    description = "VPC Zone Identifier (Subnets)"
    default = []
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

variable "subnets_public" {
    type = list
    description = "Subnets Public"
    default = []
}

variable "igw_name" {
    type = string
    description = "Internet Gateway name"
}

variable "security_group_name" {
    type = string
    description = "Security Group Name"
}

variable "security_group_configs" {
    type = map
    description = "Security Group Configs"
}

variable "security_groups" {
    type = list
    description = "Security Groups"
    default = []
}

variable "autoscaling_group_name" {
    type = string
    description = "Security Group Name"
}

variable "autoscaling_group_configs" {
    type = map
    description = "Autoscaling Group Configs"
}

variable "auto_scaling_group_arn" {
    type = string
    description = "Autoscaling Group ARN"
    default = "..."
}

variable "cluster_name" {
    type = string
    description = "Cluster Name"
}

variable "cluster_group_provider_configs" {
    type = map
    description = "Cluster Group Provider Configs"
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