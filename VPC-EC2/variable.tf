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