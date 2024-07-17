output "frontend_instance_id" {
  value = aws_instance.frontend-ec2[*].id
}

output "backend_instance_id" {
  value = aws_instance.backend-ec2[*].id
}
