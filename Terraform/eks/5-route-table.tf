resource "aws_route_table" "private-1a" {
    vpc_id = aws_vpc.main.id

    route {
       cidr_block = "0.0.0.0/0"
       nat_gateway_id = aws_nat_gateway.nat-1a.id
    }

    tags = {
        "Name" = "eks-route-private-1a"
    }

}

resource "aws_route_table" "private-1b" {
    vpc_id = aws_vpc.main.id

    route {
       cidr_block = "0.0.0.0/0"
       nat_gateway_id = aws_nat_gateway.nat-1b.id
    }

    tags = {
        "Name" = "eks-route-private-1b"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
       cidr_block = "0.0.0.0/0"
       gateway_id  = aws_internet_gateway.igw.id
    }

    tags = {
        "Name" = "eks-route-public"
    }
}

resource "aws_route_table_association" "association-private-1a" {
    subnet_id = aws_subnet.private-us-east-1a.id
    route_table_id = aws_route_table.private-1a.id
}

resource "aws_route_table_association" "association-private-1b" {
    subnet_id = aws_subnet.private-us-east-1b.id
    route_table_id = aws_route_table.private-1b.id
}

resource "aws_route_table_association" "association-public-1a" {
    subnet_id = aws_subnet.public-us-east-1a.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "association-public-1b" {
    subnet_id = aws_subnet.public-us-east-1b.id
    route_table_id = aws_route_table.public.id
}



