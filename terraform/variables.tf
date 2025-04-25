variable "region" {
  default = "eu-west-3"
}

variable "ami" {
  default = "ami-04435e37b3df0b80b"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "db_username" {
  description = "Username for the RDS instance"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS instance"
  default     = "password1234"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}
