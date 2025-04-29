# Terraform configuration for AWS infrastructure
# This file specifies the required provider and its version for the Terraform project.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}