# Output for VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.ym_vpc.vpc_id
}

# Output for RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.mariadb_instance.endpoint
}
# Output for EC2 instance ID
output "ec2_instance_id" {
  value = aws_instance.java_ec2.id
}
# Output for S3 bucket ARN
output "s3_bucket_arn" {
  value = module.ym_s3_bucket.bucket_arn
}
# Output for S3 bucket name
output "s3_bucket_name" {
  value = module.ym_s3_bucket.bucket_name
}
# Output for Security Group ID
output "security_group_id" {
  value = aws_security_group.ym_sg.id
}
# Output for RDS Security Group ID
output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

# Output for Subnet IDs
output "subnet_ids" {
  value = [
    aws_subnet.ym_pub_subnet.id,
    aws_subnet.ym_priv_subnet.id,
    aws_subnet.ym_priv_subnet_2.id
  ]
}
# Output for EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.java_ec2.public_ip
}
# Output for EC2 Private IP
output "ec2_private_ip" {
  value = aws_instance.java_ec2.private_ip
}
# Output for RDS Instance ID
output "rds_instance_id" {
  value = aws_db_instance.mariadb_instance.id
}
