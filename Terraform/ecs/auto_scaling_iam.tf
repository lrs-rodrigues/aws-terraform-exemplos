resource "aws_iam_role" "ecs-cluster" {
  name = "ecs-cluster-${var.env}"

  assume_role_policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": ["ec2.amazonaws.com", "ecs.amazonaws.com", "application-autoscaling.amazonaws.com", "ecs-tasks.amazonaws.com"]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
  })

}


resource "aws_iam_role_policy_attachment" "ecs-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.ecs-cluster.name
}

resource "aws_iam_instance_profile" "ecs-cluster-profile" {
  name = "ecs-cluster-iam"
  role = aws_iam_role.ecs-cluster.name
}