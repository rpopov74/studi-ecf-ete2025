# Terraform configuration for AWS infrastructure
provider "aws" {
  region = var.region
}

# Create VPC
module "ym_vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "YourMedia-VPC"
}


# Create EC2 Instance
resource "aws_instance" "java_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.ym_pub_subnet.id
  vpc_security_group_ids = [aws_security_group.ym_sg.id] 
  key_name      = "ym_ssh_key"
  tags = {
    Name = "Centos10_JDK21"
  }
}

# Create RDS Instance with MariaDB
resource "aws_db_instance" "mariadb_instance" {
  allocated_storage    = 20
  engine               = "mariadb"
  engine_version       = "10.6"
  instance_class       = "db.t3.micro"
  db_name                 = "yourmedia_db"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mariadb10.6"
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id] 
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = true # Désactiver le snapshot final
  
  tags = {
    Name = "YourMedia-MariaDB"
  }
}
