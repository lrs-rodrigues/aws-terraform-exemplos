resource "aws_iam_policy" "policy-ecs" {
  name        = "policy-ecs"
  description = "ECS Policy"

  policy = file("${path.module}/inventories/${var.env}/policy/policy-ecs.json")
}

resource "aws_iam_policy" "policy-ecs-task" {
  name        = "policy-ecs-task"
  description = "ECS Task Policy"

  policy = file("${path.module}/inventories/${var.env}/policy/policy-ecs-task.json")
}

resource "aws_iam_policy" "policy-ecs-service" {
  name        = "policy-ecs-service"
  description = "ECS Service Policy"

  policy = file("${path.module}/inventories/${var.env}/policy/policy-ecs-service.json")
}
