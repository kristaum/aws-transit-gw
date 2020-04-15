##### Creating VPC to reach internet
resource "aws_vpc" "vpc_app1" {
  cidr_block    = var.cidr
  tags          = merge(local.vpc_tag, local.standard_tags)
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc_app1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.160.0.0/25"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##### Creation of 2 private subenets on different AZs
resource "aws_subnet" "priv_app_sub_1" {
  vpc_id            = aws_vpc.vpc_app1.id
  cidr_block        = var.priv_app_sub_1
  tags              = merge(local.priv_app_sub_1_tag, local.standard_tags)
  availability_zone_id = "use1-az1"
}

resource "aws_subnet" "priv_app_sub_2" {
  vpc_id            = aws_vpc.vpc_app1.id
  cidr_block        = var.priv_app_sub_2
  tags              = merge(local.priv_app_sub_2_tag, local.standard_tags)
  availability_zone_id = "use1-az2"
}

##### Create Route tables for pub and priv subnets
resource "aws_default_route_table" "priv_rtb" {
    default_route_table_id  = aws_vpc.vpc_app1.default_route_table_id
    tags                    = local.standard_tags
    route {
      cidr_block = "0.0.0.0/0"
      transit_gateway_id = var.transit_gateway_id
    }
}
