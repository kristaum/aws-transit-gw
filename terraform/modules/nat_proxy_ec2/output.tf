output "proxy1_ec2" {
  value = aws_instance.nat_proxy_1.id
}

output "eth0_proxy1" {
  value = aws_instance.nat_proxy_1.primary_network_interface_id
}
