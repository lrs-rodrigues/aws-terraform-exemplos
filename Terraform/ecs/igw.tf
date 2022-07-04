# https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/VPC_Internet_Gateway.html

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = "ecs_igw"
    }
}