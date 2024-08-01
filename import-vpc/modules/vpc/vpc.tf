locals {
    ami-id = "ami-04a81a99f5ec58529"
    ec2_type = "t2.micro"
    mukesh_key_name = "docker"
}


resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/27"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "mukesh-vpc"
  }
}

resource "aws_subnet" "public_subnet_test" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = cidrsubnet(aws_vpc.test_vpc.cidr_block, 1, 0)
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "${var.subnet_names[0]}"
  }

  depends_on = [aws_internet_gateway.test_igw]
}

resource "aws_subnet" "private_subnet_test" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = cidrsubnet(aws_vpc.test_vpc.cidr_block, 1, 1)
  availability_zone = var.availability_zones[1]
  
  tags = {
    Name = "${var.subnet_names[1]}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "mukesh-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.test_nat_gateway.id

  }

  tags = {
    Name = "mukesh-private-rt"
  }

  depends_on = [aws_internet_gateway.test_igw]
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet_test.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private_subnet_test.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "mukesh-igw"
  }
}

resource "aws_nat_gateway" "test_nat_gateway" {
  allocation_id = aws_eip.test_eip.id
  subnet_id     = aws_subnet.public_subnet_test.id

  tags = {
    Name = "mukesh-nat-gateway"
  }
}

resource "aws_eip" "test_eip" {
  domain = "vpc"

  tags = {
    Name = "mukesh-eip"
  }
}





























