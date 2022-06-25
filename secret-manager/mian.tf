
resource "aws_secretsmanager_secret" "user" {
    name = var.name
    description = "Estudo Token - ${var.service}" 
    tags = {
        service = var.service
        environment = var.environment
    }
    kms_key_id = var.kms_arn
}