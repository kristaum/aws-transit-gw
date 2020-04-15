output "vpc_app1_id" {
  value = aws_vpc.vpc_app1.id
}

output "subnet_priv_app_1" {
  value = aws_subnet.priv_app_sub_1.id
}

output "subnet_priv_app_2" {
  value = aws_subnet.priv_app_sub_2.id
}
