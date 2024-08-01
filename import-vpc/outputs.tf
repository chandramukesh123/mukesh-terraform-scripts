output "vpc_id" {
  description = "This is mukesh vpc's id"
  value = module.vpc_module.mukesh_vpc_id  
}
output "dns_host" {
  description = "This is mukesh vpc's dns hostname"
  value = module.vpc_module.dns_host
}

output "dns_support" {
  description = "This is mukesh vpc's dns support"
  value = module.vpc_module.dns_support
}