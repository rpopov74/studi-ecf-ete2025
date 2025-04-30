# Output for VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.ym_vpc.vpc_id
}

# Output for RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.mariadb_instance.endpoint
}
