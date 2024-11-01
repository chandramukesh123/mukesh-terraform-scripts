resource "aws_subnet" "dev_public_subnet" {
    vpc_id = aws_vpc.Dev_vpc.id
    cidr_block = "10.0.0.0/26"

      tags = {
        Name = "Dev_public_subnet"
      }
  
}

resource "aws_subnet" "dev_private_subnet1" {
  vpc_id = aws_vpc.Dev_vpc.id
  cidr_block = "10.0.0.64/26"
  availability_zone = "us-east-1a"  

    tags = {
      Name = "Dev_private_subent1"
    }
}

resource "aws_subnet" "dev_private_subnet2" {
  vpc_id = aws_vpc.Dev_vpc.id
  cidr_block = "10.0.0.128/26"
  availability_zone = "us-east-1b"

    tags = {
      Name = "Dev_private_subent2"
    }
}