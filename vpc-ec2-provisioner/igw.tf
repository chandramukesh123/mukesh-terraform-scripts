resource "aws_internet_gateway" "mukesh_igw" {
  vpc_id = aws_vpc.mukesh-vpc.id
  tags = {
    Name = "mukesh_internet_gateway"
  }
}