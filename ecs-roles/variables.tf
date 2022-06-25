variable "env" {
    type = string
    description = "Variavel de Ambiente"
}

variable "account_name" {
  type = string
  description = "Nome da conta"
}

variable "region" {
    type = string
    description = "Região da AWS"
    default = "us-east-1"
}
