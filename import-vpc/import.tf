import {
  to = module.vpc_module.aws_vpc.test_vpc
  id = "vpc-0ee9c0b1c016040aa"
}

import {
  to = module.vpc_module.aws_subnet.public_subnet_test
  id = "subnet-0ca0e430d974ad83f"
}

import {
  to = module.vpc_module.aws_subnet.private_subnet_test
  id = "subnet-0226f6ec693232601"
}


import {
  to = module.vpc_module.aws_route_table.public_rt
  id = "rtb-062d21391f41c23b1"
}


import {
  to = module.vpc_module.aws_internet_gateway.test_igw
  id = "igw-0ce95d77fb7dc6463"
}

import {
  to = module.vpc_module.aws_route_table_association.public_rt_association
  id = "subnet-0ca0e430d974ad83f/rtb-062d21391f41c23b1"
}