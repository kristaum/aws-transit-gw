output "vpc_egress_id" {
  value = aws_vpc.vpc_egress.id
}

output "default_route_table_id" {
  value = aws_default_route_table.priv_rtb.id
}

output "subnet_priv_1" {
  value = aws_subnet.priv_sub_1.id
}

output "subnet_priv_2" {
  value = aws_subnet.priv_sub_2.id
}

output "subnet_priv_3" {
  value = aws_subnet.priv_sub_3.id
}

output "eni_proxy1" {
  value = aws_network_interface.proxy_1_eth1.id
}

output "eni_proxy2" {
  value = aws_network_interface.proxy_2_eth1.id
}

output "eni_proxy3" {
  value = aws_network_interface.proxy_3_eth1.id
}

output "sg_eth0_egress" {
  value = aws_security_group.internal_inbound.id
}
