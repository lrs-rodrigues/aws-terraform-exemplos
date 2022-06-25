variable "name" {
  type = string
  description = "Nome do Segredo"
}

variable "description" {
  type = string
  description = "Descrição do Segredo"
}

variable "service" {
  type = string
  description = "Nome do serviço"
}

variable "environment" {
  type = string
  description = "Nome do ambiente"
  default = "estudos"
}

variable "kms_arn" {
  type = string
  description = "Chave KMS"
}