data "aws_ami" "ubuntu" {
    most_recent = true

}

    resource "aws_instance" "terraform-ubuntu" {
        ami = "ami-0866a3c8686eaeeba"
        instance_type = "t2.micro"
        key_name = "docker"
        associate_public_ip_address = true
        subnet_id = aws_subnet.dev_public_subnet.id
        vpc_security_group_ids = [aws_security_group.mukesh-sg.id]
        
        root_block_device {
          volume_size = 10
          volume_type = "gp2"
        }

           tags = {
            Name = "terraform-ec2" 
           }

    }

    

