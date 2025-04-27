terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create VPC
resource "aws_vpc" "ym_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "YourMedia-VPC"
  }
}

# Create Subnet
resource "aws_subnet" "ym_pub_subnet" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "YourMedia-Public-Subnet"
  }
}
# Create an additional Subnet in another AZ
resource "aws_subnet" "ym_pub_subnet_2" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b" # Zone de disponibilité différente
  tags = {
    Name = "YourMedia-Public-Subnet-2"
  }
}

# Create an additional Subnet in another AZ
resource "aws_subnet" "ym_pub_subnet_3" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-3c" # Zone de disponibilité différente
  tags = {
    Name = "YourMedia-Public-Subnet-3"
  }
}

# Create Security Group
resource "aws_security_group" "ym_sg" {
  vpc_id = aws_vpc.ym_vpc.id
  #traffic entrant
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #traffic sortant
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "YourMedia-SG"
  }
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
  vpc_security_group_ids = [aws_security_group.ym_sg.id] 
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = true # Désactiver le snapshot final
  
  tags = {
    Name = "YourMedia-MariaDB"
  }
}

# Create DB Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "ym-rds-subnet-group"
  subnet_ids = [
    aws_subnet.ym_pub_subnet.id,
    aws_subnet.ym_pub_subnet_2.id,
    aws_subnet.ym_pub_subnet_3.id
    ] 
  tags = {
    Name = "YourMedia-RDS-Subnet-Group"
  }
}

#Acces Internet

resource "aws_internet_gateway" "ym_igw" {
  vpc_id = aws_vpc.ym_vpc.id
  tags = {
    Name = "YourMedia-Internet-Gateway"
  }
}

resource "aws_route_table" "ym_route_table" {
  vpc_id = aws_vpc.ym_vpc.id
  tags = {
    Name = "YourMedia-Route-Table"
  }
}

resource "aws_route" "ym_route" {
  route_table_id         = aws_route_table.ym_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ym_igw.id
}

resource "aws_route_table_association" "ym_route_table_assoc" {
  subnet_id      = aws_subnet.ym_pub_subnet.id
  route_table_id = aws_route_table.ym_route_table.id
}

output "ec2_public_ip" {
  value = aws_instance.java_ec2.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.mariadb_instance.endpoint
}
