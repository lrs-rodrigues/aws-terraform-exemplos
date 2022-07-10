variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "auto_scaling_group_arn" {
    type = string
    description = "Autoscaling Group ARN"
}

variable "cluster_name" {
    type = string
    description = "Cluster Name"
}

variable "cluster_group_provider_configs" {
    type = map
    description = "Cluster Group Provider Configs"
}