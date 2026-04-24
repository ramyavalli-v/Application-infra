output "dns_name" {
  value = aws_lb.this.dns_name
}

output "zone_id" {
  value = aws_lb.this.zone_id
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}

output "arn" {
  description = "ARN of the ALB"
  value       = aws_lb.this.arn
}

output "listener_arn" {
  description = "ARN of the HTTP listener"
  value       = aws_lb_listener.http.arn
}
