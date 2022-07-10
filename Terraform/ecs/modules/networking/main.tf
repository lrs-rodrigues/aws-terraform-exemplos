resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block

    enable_dns_support = var.vpc_enable_dns_support
    enable_dns_hostnames = var.vpc_enable_dns_hostnames

    tags = {
        Name = var.vpc_name
    }
}


resource "aws_subnet" "subnet" {
    for_each = var.subnets

    vpc_id = aws_vpc.main.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.public_ip

    tags = {
        "Name" = each.key
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = var.igw_name
    }
}

resource "aws_eip" "eip" {
    for_each = {for key, val in var.subnets: key => val if val.public_ip == true}
    vpc = true

    tags = {
        Name = "eip-${each.key}"
        VPC =  aws_vpc.main.id
    }
}

resource "aws_nat_gateway" "nat" {
    for_each = {for key, val in var.subnets: key => val if val.public_ip == true}
    subnet_id = aws_subnet.subnet[each.key].id
    allocation_id = aws_eip.eip[each.key].id

    tags = {
      Name = "nat-${each.key}"
      VPC =  aws_vpc.main.id
      Subnet = each.key
    }

    depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "route_table_private" {
    for_each = {for key, val in var.subnets: key => val if val.public_ip == false}
    vpc_id = aws_vpc.main.id

    route {
       cidr_block = "0.0.0.0/0"
       nat_gateway_id = aws_nat_gateway.nat[replace(each.key, "private",  "public")].id
    }

    tags = {
        "Name" = "route-${each.key}"
    }
}

resource "aws_route_table" "route_table_public" {
    vpc_id = aws_vpc.main.id

    route {
       cidr_block = "0.0.0.0/0"
       gateway_id  = aws_internet_gateway.igw.id
    }

    tags = {
        "Name" = "route-table-public"
    }
}

resource "aws_route_table_association" "route_table_association_private" {
    for_each = {for key, val in var.subnets: key => val if val.public_ip == false}

    subnet_id = aws_subnet.subnet[each.key].id
    route_table_id = aws_route_table.route_table_private[each.key].id 
}


resource "aws_route_table_association" "route_table_association_public" {
    for_each = {for key, val in var.subnets: key => val if val.public_ip == true}

    subnet_id = aws_subnet.subnet[each.key].id
    route_table_id = aws_route_table.route_table_public.id 
}



