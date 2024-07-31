module "module_vpc" {
  source = "./modules/vpc"

}

module "module_ec2" {
  source = "./modules/ec2"
  var_vpc_id = module.module_vpc.mukesh_vpc_id
  var_private_subnet_id = module.module_vpc.mukesh_private_subnet_id
  var_public_subnet_id = module.module_vpc.mukesh_public_subnet_id
}

