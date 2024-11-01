resource "aws_db_instance" "oracle_db" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "oracle-se2"
  engine_version = "19"
  instance_class = "db.t3.medium"
  db_name = "oradb6"
  username = "admin"
  password = "mysecurejingilaka"
  db_subnet_group_name = aws_db_subnet_group.mukesh-oracle-subnetgroup.name
  vpc_security_group_ids = [aws_security_group.mukesh-sg.id]
  license_model         = "license-included"
  

  tags = {
    Name = "Mukesh-oracle-DB"
  }
}



resource "aws_db_subnet_group" "mukesh-oracle-subnetgroup" {
  name = "mukesh-oracle-subnetgroup"
  subnet_ids = [aws_subnet.dev_private_subnet1.id,aws_subnet.dev_private_subnet2.id]

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_security_group" {
  name        = "rds_security_group"
  description = "Allow access to RDS"
  vpc_id      = aws_vpc.Dev_vpc.id

  ingress {
    from_port   = 1521  # Oracle default port
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed for your use case
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]  # Change as needed
  }

  tags = {
    Name = "RDS Security Group"
  }
}
