variable "cidr" {
  description   = "CIDR of the VPC"
  type          = string
  default       = "10.160.0.0/25"
}

variable "priv_subnet1" {
  description   = "CIDR of the priv subnet 1"
  type          = string
  default       = "10.160.0.0/28"
}

variable "priv_subnet2" {
  description   = "CIDR of the priv subnet 2"
  type          = string
  default       = "10.160.0.16/28"
}

variable "priv_subnet3" {
  description   = "CIDR of the priv subnet 3"
  type          = string
  default       = "10.160.0.32/28"
}

variable "pub_subnet1" {
  description   = "CIDR of the pub subnet 1"
  type          = string
  default       = "10.160.0.48/28"
}

variable "pub_subnet2" {
  description   = "CIDR of the pub subnet 2"
  type          = string
  default       = "10.160.0.64/28"
}

variable "pub_subnet3" {
  description   = "CIDR of the pub subnet 3"
  type          = string
  default       = "10.160.0.80/28"
}

variable "transit_gateway_id" {
  description   = "Transit Gateway ID created from tgw module"
  type          = string
  default       = ""
}

variable "eth0_proxy1" {
  description   = "EC2 eth0 from proxy 1"
  type          = string
  default       = ""
}

variable "proxy1_ec2" {
  description   = "EC2 ID from proxy 1"
  type          = string
  default       = ""
}

variable "vpc_name" {
  description   = "VPC Egress name"
  type          = string
  default       = "vpc-egress"
}

variable "igw_name" {
  description   = "Internet Gateway Name"
  type          = string
  default       = "igw-vpc-egress"
}

variable "sg_inbound_name" {
  description   = "Security Group name for subnet public"
  type          = string
  default       = "sg-sub-pub-inbound"
}

variable "sg_internal_name" {
  description   = "Security Group name for subnet public"
  type          = string
  default       = "sg-sub-priv-inbound"
}

variable "sub_priv_name" {
  description   = "Private subnet name"
  type          = string
  default       = "egress-private"
}

variable "sub_pub_name" {
  description   = "Public subnet name"
  type          = string
  default       = "egress-public"
}

variable "proxy_1_eth1_name" {
  description   = "ENI name for the public route"
  type          = string
  default       = "proxy-eni-1"
}

variable "proxy_1_pub_name" {
  description   = "EIP name for proxy ENI"
  type          = string
  default       = "eip-proxy-1"
}

variable "proxy_2_eth1_name" {
  description   = "ENI name for the public route"
  type          = string
  default       = "proxy-eni-2"
}

variable "proxy_2_pub_name" {
  description   = "EIP name for proxy ENI"
  type          = string
  default       = "eip-proxy-2"
}

variable "proxy_3_eth1_name" {
  description   = "ENI name for the public route"
  type          = string
  default       = "proxy-eni-3"
}

variable "proxy_3_pub_name" {
  description   = "EIP name for proxy ENI"
  type          = string
  default       = "eip-proxy-3"
}

variable "pub_rtb_name" {
  description   = "Public Route table name"
  type          = string
  default       = "pub-egress-rtb"
}

variable "pri_rtb1_name" {
  description   = "Private Route table name"
  type          = string
  default       = "priv-egress-rtb1"
}

variable "pri_rtb2_name" {
  description   = "Private Route table name"
  type          = string
  default       = "priv-egress-rtb2"
}

variable "pri_rtb3_name" {
  description   = "Private Route table name"
  type          = string
  default       = "priv-egress-rtb3"
}

variable "application" {
  description   = "Standard name to identify resources"
  type          = string
  default       = "transit-proxy-terraform"
}

variable "team_name" {
  description   = "Resource owner team name"
  type          = string
  default       = "Cloud Infrastructure"
}

variable "team_email" {
  description   = "Resource owner email"
  type          = string
  default       = "cloudinfra"
}
