output "auto_scaling_group_arn" {
    description = "Auto Scaling Group ARN"
    value = aws_autoscaling_group.main.arn
}