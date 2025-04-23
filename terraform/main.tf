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
  cidr_block = "10.0.0.0/16"
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
