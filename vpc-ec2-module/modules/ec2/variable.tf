variable "region" {
  type = string
  default = "us-east-1"
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "instance_names" {
  type = list(string)
  default = [ "mukesh-public-ec2", "mukesh-private-ec2" ]
}

variable "subnet_names" {
  type = list(string)
  default = [ "mukesh-public-subnet", "mukesh-private-subnet" ]
  
}

variable "var_vpc_id" {
  description = "VPC id where ec2 need to create"
  type = string
}

variable "var_public_subnet_id" {
  description = "public subnet id where public ec2 to create"
  type = string
}

variable "var_private_subnet_id" {
  description = "private subnet id where private ec2 to create"
  type = string
}

  
