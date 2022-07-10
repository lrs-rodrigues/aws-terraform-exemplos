resource "aws_iam_role" "ecs-cluster-iam" {
  name = "ecs-cluster-iam-${var.env}"

  assume_role_policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": ["ec2.amazonaws.com", "ecs.amazonaws.com", "ecs-tasks.amazonaws.com"]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
  })

}


resource "aws_iam_role_policy_attachment" "ecs-cluster-iam-policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.ecs-cluster-iam.name
}

resource "aws_iam_instance_profile" "ecs-cluster-iam-profile" {
  name = "ecs-cluster-iam-profile-${var.env}"
  role = aws_iam_role.ecs-cluster-iam.name
}