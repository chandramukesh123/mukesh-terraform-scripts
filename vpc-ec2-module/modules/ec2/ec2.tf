locals {
    ami-id = "ami-04a81a99f5ec58529"
    ec2_type = "t2.micro"
    mukesh_key_name = "docker"
}

resource "aws_instance" "public-instance" {

    ami = local.ami-id
    instance_type = local.ec2_type
    associate_public_ip_address = true
    subnet_id = var.var_public_subnet_id
    availability_zone = var.availability_zones[0]
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    key_name = local.mukesh_key_name

    root_block_device {
      volume_size = 8
      volume_type = "gp2"
    }

    tags = {
        
      Name = "${var.instance_names[0]}"
  
    }

    depends_on = [var.var_public_subnet_id]
}
    resource "aws_instance" "private-instance" {

    ami = local.ami-id
    instance_type = local.ec2_type
    associate_public_ip_address = true
    subnet_id = var.var_private_subnet_id
    availability_zone = var.availability_zones[1]
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    key_name = local.mukesh_key_name

    root_block_device {
      volume_size = 8
      volume_type = "gp2"
    }
    
    tags = {
        
        Name = "${var.instance_names[1]}"
    }

    depends_on = [var.var_private_subnet_id]
}
