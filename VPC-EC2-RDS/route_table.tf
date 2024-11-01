resource "aws_route_table" "Dev_public_route_table" {
  vpc_id = aws_vpc.Dev_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Dev_internet_gateway.id
        }

    tags = {
      Name = "Dev_public_route_table"
    }
  
}

resource "aws_route_table" "Dev_private_route_table" {
  vpc_id = aws_vpc.Dev_vpc.id

  tags = {
    Name = "Dev_private_route_table"
  }
}