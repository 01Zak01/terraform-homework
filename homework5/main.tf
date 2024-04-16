provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr[0].vpc_cidr
  enable_dns_hostnames = var.dns_support_host[0].dns_support_host
  enable_dns_support   = var.dns_support[0].dns_support
  tags = {
    Name = "kaizen"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr[0].cidr
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone       = "${var.region}a" #${var.region}a  / #"us-east-2a"

  tags = {
    Name = var.subnet_cidr[0].subnet_name
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr[1].cidr
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone       = "${var.region}b"

  tags = {
    Name = var.subnet_cidr[1].subnet_name
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr[2].cidr
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone       = "${var.region}c"

  tags = {
    Name = var.subnet_cidr[2].subnet_name
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr[3].cidr
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone       = "${var.region}d"

  tags = {
    Name = var.subnet_cidr[3].subnet_name
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.rt_name[0]
  }
}

resource "aws_route_table" "priv" {
  vpc_id = aws_vpc.main.id

  #   route {
  #     cidr_block = "0.0.0.0/0"
  #     gateway_id = aws_internet_gateway.gw.id
  #   }

  tags = {
    Name = var.rt_name[1]
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.pub.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.pub.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.priv.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.subnet4.id
  route_table_id = aws_route_table.priv.id
}