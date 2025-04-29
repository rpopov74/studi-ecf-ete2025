#Public subnet
resource "aws_subnet" "ym_pub_subnet" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "YourMedia-Public-Subnet"
  }
}
# Private Subnet 
resource "aws_subnet" "ym_priv_subnet" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b" 
  tags = {
    Name = "YourMedia-Private-Subnet"
  }
}

#Another private Subnet for RDS
# This subnet is in a different availability zone for high availability
resource "aws_subnet" "ym_priv_subnet_2" {
  vpc_id     = aws_vpc.ym_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-3c" 
  tags = {
    Name = "YourMedia-private-Subnet-2"
  }
}
# Create a DB Subnet Group for RDS
# Create DB Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "ym-rds-subnet-group"
  subnet_ids = [
    aws_subnet.ym_priv_subnet.id,
    aws_subnet.ym_priv_subnet_2.id
    ] 
  tags = {
    Name = "YourMedia-RDS-Subnet-Group"
  }
}
