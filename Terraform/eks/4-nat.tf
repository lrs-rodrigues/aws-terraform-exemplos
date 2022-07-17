resource "aws_eip" "eip-1a" {
    vpc = true

    tags = {
        Name = "eks-eip-1a"
        VPC =  aws_vpc.main.id
    }
}

resource "aws_eip" "eip-1b" {
    vpc = true

    tags = {
        Name = "eks-eip-1b"
        VPC =  aws_vpc.main.id
    }
}

resource "aws_nat_gateway" "nat-1a" {
    subnet_id = aws_subnet.public-us-east-1a.id
    allocation_id = aws_eip.eip-1a.id

    tags = {
      Name = "eks-nat-1a"
      VPC =  aws_vpc.main.id
      Subnet = aws_subnet.public-us-east-1a.id
    }

    depends_on = [aws_internet_gateway.igw]
}


resource "aws_nat_gateway" "nat-1b" {
    subnet_id = aws_subnet.public-us-east-1b.id
    allocation_id = aws_eip.eip-1b.id

    tags = {
      Name = "eks-nat-1b"
      VPC =  aws_vpc.main.id
      Subnet = aws_subnet.public-us-east-1b.id
    }

    depends_on = [aws_internet_gateway.igw]
}