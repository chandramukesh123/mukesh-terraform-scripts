resource "aws_route_table" "mukesh-public-route" {
  vpc_id = aws_vpc.mukesh-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mukesh_igw.id
  }
  tags = {
    Name = "mukesh_public_route_table"
  }
}