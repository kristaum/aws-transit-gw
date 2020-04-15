#creates the attachment to the TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_app1_attachment" {
    transit_gateway_id  = var.transit_gateway_id
    vpc_id              = var.vpc_app1_id
    subnet_ids          = [ var.subnet_priv_1, var.subnet_priv_2 ]
    dns_support         = "enable"
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags                = {
      Name          = var.app1_attachment_name
      Application   = var.application
      Team          = var.team_name
      Email         = var.team_email
    }
}

#associate and propagate the new VPC attachment
#tgw<->vpc trtb associations
resource "aws_ec2_transit_gateway_route_table_association" "egress_association" {
    transit_gateway_attachment_id   = aws_ec2_transit_gateway_vpc_attachment.vpc_app1_attachment.id
    transit_gateway_route_table_id  = var.transit_rtb_id
}

#tgw<->vpc trtb propagations
resource "aws_ec2_transit_gateway_route_table_propagation" "egress_propagation" {
    transit_gateway_attachment_id   = aws_ec2_transit_gateway_vpc_attachment.vpc_app1_attachment.id
    transit_gateway_route_table_id  = var.transit_rtb_id
}
