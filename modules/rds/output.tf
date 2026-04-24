output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "port" {
  description = "RDS port"
  value       = aws_db_instance.this.port
}

output "identifier" {
  description = "RDS identifier"
  value       = aws_db_instance.this.identifier
}