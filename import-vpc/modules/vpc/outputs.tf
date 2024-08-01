output "mukesh_vpc_id" {
 description = "This is mukesh vpc's id"
 value = aws_vpc.test_vpc.id
}

output "dns_host" {
  description = "This is mukesh vpc's dns hostname"
  value = aws_vpc.test_vpc.enable_dns_hostnames
}

output "dns_support" {
  description = "This is mukesh vpc's dns support"
  value = aws_vpc.test_vpc.enable_dns_support
}