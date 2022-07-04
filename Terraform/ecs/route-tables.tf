# https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html

resource "aws_route_table" "private-1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-1a.id
  }

  tags = {
    "Name" = "route_private_1a"
  }
}

resource "aws_route_table" "private-1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-1b.id
  }

  tags = {
    "Name" = "route_private_1a"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "route_public"
  }
}

resource "aws_route_table_association" "private-us-east-1a" {
    subnet_id = aws_subnet.private-us-east-1a.id
    route_table_id = aws_route_table.private-1a.id
}

resource "aws_route_table_association" "private-us-east-1b" {
    subnet_id = aws_subnet.private-us-east-1b.id
    route_table_id = aws_route_table.private-1b.id
}


resource "aws_route_table_association" "public-us-east-1a" {
    subnet_id = aws_subnet.public-us-east-1a.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
    subnet_id = aws_subnet.public-us-east-1b.id
    route_table_id = aws_route_table.public.id
}