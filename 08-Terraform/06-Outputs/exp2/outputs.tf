output "backend_public_ips" {
  value = aws_instance.backend.*.public_ip
}

output "backend_public_dns" {
  value = aws_instance.backend.*.public_dns
}

output "frontend_public_dns" {
  value = aws_instance.frontend.*.public_dns
}
