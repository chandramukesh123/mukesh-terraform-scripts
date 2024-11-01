output "ec2_ip_address" {
  value = aws_instance.terraform-ubuntu.id
}

output "my_vpc_id" {
    value = aws_vpc.Dev_vpc.id
}