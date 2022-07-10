resource "aws_iam_role" "autoscaling-iam" {
  name = "autoscaling-iam-${var.env}"

  assume_role_policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": ["application-autoscaling.amazonaws.com"]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
  })

}


resource "aws_iam_role_policy_attachment" "autoscaling-iam-policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.autoscaling-iam.name
}

resource "aws_iam_instance_profile" "autoscaling-iam-profile" {
  name = "autoscaling-iam-profile-${var.env}"
  role = aws_iam_role.autoscaling-iam.name
}