output "security_groups" {
    description = "security_groups"
    value = [aws_security_group.security.id]
}