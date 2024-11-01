resource "aws_internet_gateway" "Dev_internet_gateway" {
    vpc_id = aws_vpc.Dev_vpc.id


    tags = {
      Name = "Dev_Internet_Gateway"
    }
}