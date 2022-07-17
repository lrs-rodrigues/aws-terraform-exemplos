resource "aws_subnet" "private-us-east-1a" {
    vpc_id = aws_vpc.main.id
    cidr_block =  "172.31.0.0/18"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
        "Name" = "private-us-east-1a"
    }
}

resource "aws_subnet" "private-us-east-1b" {
    vpc_id = aws_vpc.main.id
    cidr_block ="172.31.64.0/18"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false

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
    cidr_block = "172.31.192.0/18"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "public-us-east-1b"
    }
}