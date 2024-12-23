resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "TF" {
  key_name   = "TF"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "TFF" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "TF_KEY"
}
