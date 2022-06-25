resource "aws_iam_role" "ecs-cluster-role" {
  name = "ecs-cluster-role"

  assume_role_policy = file("${path.module}/inventories/${var.env}/role/trust-ecs-cluster.json")
  managed_policy_arns = [aws_iam_policy.policy-ecs.arn, aws_iam_policy.policy-ecs-task.arn]
}

resource "aws_iam_role" "ecs-cluster-service" {
  name = "ecs-cluster-service"

  assume_role_policy = file("${path.module}/inventories/${var.env}/role/app-as.json")
  managed_policy_arns = [aws_iam_policy.policy-ecs-service.arn]
}

resource "aws_iam_instance_profile" "profile" {
  name = "ecs-cluster-role"
  role = aws_iam_role.ecs-cluster-role.name
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = var.account_name
  policy_arn = aws_iam_policy.policy-ecs.arn
}