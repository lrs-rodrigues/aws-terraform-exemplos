# https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/vpc-nat-gateway.html

resource "aws_eip" "nat-1a" {
    vpc = true

  tags = {
    Name = "ecs_nat-1a"
  }
}

resource "aws_eip" "nat-1b" {
    vpc = true

  tags = {
    Name = "ecs_nat-1b"
  }
}

resource "aws_nat_gateway" "nat-1a" {
    allocation_id = aws_eip.nat-1a.id

    subnet_id = aws_subnet.public-us-east-1a.id

    tags = {
      Name = "ecs_nat_1a"
    }

    depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat-1b" {
    allocation_id = aws_eip.nat-1b.id

    subnet_id = aws_subnet.public-us-east-1b.id

    tags = {
      Name = "ecs_nat_1b"
    }

    depends_on = [aws_internet_gateway.igw]
}