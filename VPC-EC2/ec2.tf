resource "aws_instance" "public-instance" {

    ami = local.ami-id
    instance_type = local.ec2_type
    associate_public_ip_address = true
    subnet_id = aws_subnet.public_subnet_test.id
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

    depends_on = [aws_subnet.public_subnet_test]
}
    resource "aws_instance" "instance-2" {

    ami = local.ami-id
    instance_type = local.ec2_type
    associate_public_ip_address = true
    subnet_id = aws_subnet.private_subnet_test.id
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

    depends_on = [aws_subnet.private_subnet_test]
}
