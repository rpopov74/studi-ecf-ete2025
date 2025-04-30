# Create Security Group
resource "aws_security_group" "ym_sg" {
  vpc_id = module.ym_vpc.vpc_id
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
resource "aws_security_group" "rds_sg" {
  vpc_id = module.ym_vpc.vpc_id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ym_sg.id] # Autoriser uniquement l'EC2
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}