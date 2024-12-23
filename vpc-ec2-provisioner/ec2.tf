resource "aws_instance" "mukesh_ec2" {
  instance_type   = "t2.micro"
  ami             = "ami-0e2c8caa4b6378d8c"
  subnet_id       = aws_subnet.mukesh_public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.mukesh_sg.id]
  key_name        = "TF"
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.rsa.private_key_pem
    host        = aws_instance.mukesh_ec2.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo echo HI this is Mukesh Chandra > /var/www/html/index.html",
      "sudo systemctl restart apache2",
      "sudo systemctl enable apache2",
    ]
  }
  tags = {
    Name = "ubuntu_webserver_terr"
  }
}