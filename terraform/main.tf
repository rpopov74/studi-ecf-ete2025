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

# Create a VPC
resource "aws_vpc" "yourmedia_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "YourMedia-VPC"
  }
}

# Create a Subnet
resource "aws_subnet" "yourmedia_subnet" {
  vpc_id     = aws_vpc.yourmedia_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "YourMedia-Subnet"
  }
}

# Create a Security Group
resource "aws_security_group" "yourmedia_sg" {
  vpc_id = aws_vpc.yourmedia_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
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

# Create an EC2 Instance
resource "aws_instance" "java_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.yourmedia_subnet.id
  #security_groups = [aws_security_group.yourmedia_sg.name]
  vpc_security_group_ids = [aws_security_group.yourmedia_sg.id] 
  tags = {
    Name = "Centos10_JDK21"
  }
}
