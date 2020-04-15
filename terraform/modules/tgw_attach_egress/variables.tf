variable "transit_gateway_id" {
  description   = "Transit Gateway ID created from tgw module"
  type          = string
  default       = ""
}

variable "vpc_egress_id" {
  description   = "VPC egress ID created from vpc-egress module"
  type          = string
  default       = ""
}

variable "subnet_priv_1" {
  description   = "ID of the priv subnet 1 from vpc-egress module"
  type          = string
  default       = ""
}

variable "subnet_priv_2" {
  description   = "ID of the priv subnet 2 from vpc-egress module"
  type          = string
  default       = ""
}

variable "subnet_priv_3" {
  description   = "ID of the priv subnet 3 from vpc-egress module"
  type          = string
  default       = ""
}

variable "egress_rtb_name" {
  description   = "Transit Gateway Route table name"
  type          = string
  default       = "transit-rtb"
}

variable "egress_attachment_name" {
  description   = "Transit Gateway VPC Attachment name"
  type          = string
  default       = "transit-vpc-egress-attch"
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
