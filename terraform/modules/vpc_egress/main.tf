##### Creating VPC to reach internet
resource "aws_vpc" "vpc_egress" {
  cidr_block    = var.cidr
  tags          = merge(local.vpc_tag, local.standard_tags)
}

##### Internet Gateway to access internet
resource "aws_internet_gateway" "igw" {
  vpc_id    = aws_vpc.vpc_egress.id
  tags      = merge(local.igw_tag, local.standard_tags)
}

resource "aws_security_group" "external_inbound" {
    vpc_id              = aws_vpc.vpc_egress.id
    name                = "proxy-outside-inbound"
    tags                = merge(local.sg_inbound_tag, local.standard_tags)

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_security_group" "internal_inbound" {
    vpc_id              = aws_vpc.vpc_egress.id
    name                = "proxy-internal-inbound"
    tags                = merge(local.sg_internal_tag, local.standard_tags)

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [ "10.0.0.0/8" ]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = [ "10.0.0.0/8" ]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}


##### Creation of 3 private subenets on different AZs
resource "aws_subnet" "priv_sub_1" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.priv_subnet1
  tags              = merge(local.sub_priv_tag, local.standard_tags)
  availability_zone_id = "use1-az1"
}

resource "aws_subnet" "priv_sub_2" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.priv_subnet2
  tags              = merge(local.sub_priv_tag, local.standard_tags)
  availability_zone_id = "use1-az2"
}

resource "aws_subnet" "priv_sub_3" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.priv_subnet3
  tags              = merge(local.sub_priv_tag, local.standard_tags)
  availability_zone_id = "use1-az3"
}

##### Creation of 3 public subnets on different AZs
resource "aws_subnet" "pub_sub_1" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.pub_subnet1
  tags              = merge(local.sub_pub_tag, local.standard_tags)
  availability_zone_id = "use1-az1"
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.pub_subnet2
  tags              = merge(local.sub_pub_tag, local.standard_tags)
  availability_zone_id = "use1-az2"
}

resource "aws_subnet" "pub_sub_3" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.pub_subnet3
  tags              = merge(local.sub_pub_tag, local.standard_tags)
  availability_zone_id = "use1-az3"
}

##### Creation of 3 public IPs and attach ENI to each
resource "aws_network_interface" "proxy_1_eth1" {
    source_dest_check   = false
    subnet_id           = aws_subnet.pub_sub_1.id
    security_groups     = [ aws_security_group.external_inbound.id ]
    tags                = merge(local.proxy_1_eth1_tag, local.standard_tags)
}

resource "aws_eip" "proxy_1_pub" {
    vpc                 = true
    network_interface   = aws_network_interface.proxy_1_eth1.id
    tags                = merge(local.proxy_1_pub_tag, local.standard_tags)
}

resource "aws_network_interface" "proxy_2_eth1" {
    source_dest_check   = false
    subnet_id           = aws_subnet.pub_sub_2.id
    security_groups     = [ aws_security_group.external_inbound.id ]
    tags                = merge(local.proxy_2_eth1_tag, local.standard_tags)
}

resource "aws_eip" "proxy_2_pub" {
    vpc                 = true
    network_interface   = aws_network_interface.proxy_2_eth1.id
    tags                = merge(local.proxy_2_pub_tag, local.standard_tags)
}

resource "aws_network_interface" "proxy_3_eth1" {
    source_dest_check   = false
    subnet_id           = aws_subnet.pub_sub_3.id
    security_groups     = [ aws_security_group.external_inbound.id ]
    tags                = merge(local.proxy_3_eth1_tag, local.standard_tags)
}

resource "aws_eip" "proxy_3_pub" {
    vpc                 = true
    network_interface   = aws_network_interface.proxy_3_eth1.id
    tags                = merge(local.proxy_3_pub_tag, local.standard_tags)
}

##### Create Route tables for pub and priv subnets
resource "aws_route_table" "pub_rtb" {
  vpc_id    = aws_vpc.vpc_egress.id
  tags      = merge(local.pub_rtb_tag, local.standard_tags)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = var.transit_gateway_id
  }
}

resource "aws_default_route_table" "priv_rtb" {
    default_route_table_id  = aws_vpc.vpc_egress.default_route_table_id
    tags                    = local.standard_tags
    route {
      cidr_block             = "0.0.0.0/0"
      network_interface_id   = var.eth0_proxy1
      #instance_id            = var.proxy1_ec2  #NEED TO UNCOMMENT AFTER FIRST TERRAFORM APPLY DUE TO KNOW TERRAFORM "ISSUE"
    }
    route {
      cidr_block = "10.0.0.0/8"
      transit_gateway_id = var.transit_gateway_id
    }
}

##### Associate route table for priv subnet
resource "aws_route_table_association" "priv_sub_1" {
  subnet_id         = aws_subnet.priv_sub_1.id
  route_table_id    = aws_default_route_table.priv_rtb.id
}
resource "aws_route_table_association" "priv_sub_2" {
  subnet_id         = aws_subnet.priv_sub_2.id
  route_table_id    = aws_default_route_table.priv_rtb.id
}
resource "aws_route_table_association" "priv_sub_3" {
  subnet_id         = aws_subnet.priv_sub_3.id
  route_table_id    = aws_default_route_table.priv_rtb.id
}

##### Associate Route table for pub subnet
resource "aws_route_table_association" "pub_sub_1" {
  subnet_id         = aws_subnet.pub_sub_1.id
  route_table_id    = aws_route_table.pub_rtb.id
}

resource "aws_route_table_association" "pub_sub_2" {
  subnet_id         = aws_subnet.pub_sub_2.id
  route_table_id    = aws_route_table.pub_rtb.id
}

resource "aws_route_table_association" "pub_sub_3" {
  subnet_id         = aws_subnet.pub_sub_3.id
  route_table_id    = aws_route_table.pub_rtb.id
}
