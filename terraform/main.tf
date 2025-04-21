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
  region = "eu-west-3"
}

# Create a VPC
resource "aws_vpc" "yourmedia_vpc" {
  cidr_block = "10.0.0.0/16"
}

#Create EC2
resource "aws_instance" "java_ec2" {
  ami           = "ami-04435e37b3df0b80b"
  instance_type = "t2.micro"

  tags = {
    Name = "Centos10_JDK21"
  }
}
