# Calculator CIDR - https://jodies.de/ipcalc
# Subnets - https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html
# AZ - https://howto.lintel.in/list-of-aws-regions-and-availability-zones/


resource "aws_subnet" "private-us-east-1a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "172.31.0.0/18"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "private-us-east-1a"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "172.31.64.0/18"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "private-us-east-1b"
  }
}


resource "aws_subnet" "public-us-east-1a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "172.31.128.0/18"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1a"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block ="172.31.192.0/18"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1b"
  }
}