resource "aws_ec2_transit_gateway" "tgw" {
  description                         = "AWS Transit gateway to test connection between multiple VPCs"
  auto_accept_shared_attachments      = var.auto_accept_shared_attachments
  default_route_table_association     = var.default_route_table_association
  default_route_table_propagation     = var.default_route_table_propagation
  dns_support                         = var.dns_support
  amazon_side_asn                     = var.aws_asn
  tags                                = {
    Name          = var.tgw_name
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }
}
