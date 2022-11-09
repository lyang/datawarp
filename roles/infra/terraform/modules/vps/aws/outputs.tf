output "ip_address" {
  value = aws_lightsail_static_ip.static_ip.ip_address
}

output "private_key" {
  value = aws_lightsail_key_pair.key_pair.private_key
}

output "user" {
  value = aws_lightsail_instance.server.username
}

