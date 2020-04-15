#constructs the transit route tables
resource "aws_ec2_transit_gateway_route_table" "egress_rtb" {
    transit_gateway_id  = var.transit_gateway_id
    tags                = merge(local.egress_rtb_tag, local.standard_tags)
}

#creates the attachment to the TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "egress_attachment" {
    transit_gateway_id  = var.transit_gateway_id
    vpc_id              = var.vpc_egress_id
    subnet_ids          = [ var.subnet_priv_1, var.subnet_priv_2, var.subnet_priv_3 ]
    dns_support         = "enable"
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags                = merge(local.egress_attachment_tag, local.standard_tags)
}

resource "aws_ec2_transit_gateway_route" "egress_default" {
    destination_cidr_block          = "0.0.0.0/0"
    transit_gateway_attachment_id   = aws_ec2_transit_gateway_vpc_attachment.egress_attachment.id
    transit_gateway_route_table_id  = aws_ec2_transit_gateway_route_table.egress_rtb.id
}

#associate and propagate the new VPC attachment
#tgw<->vpc trtb associations
resource "aws_ec2_transit_gateway_route_table_association" "egress_association" {
    transit_gateway_attachment_id   = aws_ec2_transit_gateway_vpc_attachment.egress_attachment.id
    transit_gateway_route_table_id  = aws_ec2_transit_gateway_route_table.egress_rtb.id
}

#tgw<->vpc trtb propagations
resource "aws_ec2_transit_gateway_route_table_propagation" "egress_propagation" {
    transit_gateway_attachment_id   = aws_ec2_transit_gateway_vpc_attachment.egress_attachment.id
    transit_gateway_route_table_id  = aws_ec2_transit_gateway_route_table.egress_rtb.id
}
