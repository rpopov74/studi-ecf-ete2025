# Output for EC2 public IP
output "ec2_public_ip" {
  value = aws_instance.java_ec2.public_ip
}

# Output for RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.mariadb_instance.endpoint
}