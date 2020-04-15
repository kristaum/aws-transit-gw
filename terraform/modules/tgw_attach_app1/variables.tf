variable "transit_gateway_id" {
  description   = "Transit Gateway ID created from tgw module"
  type          = string
  default       = ""
}

variable "vpc_app1_id" {
  description   = "VPC APP1 ID created from vpc_app1 module"
  type          = string
  default       = ""
}

variable "transit_rtb_id" {
  description   = "Transit Route table ID created from twg_attach_egress module"
  type          = string
  default       = ""
}

variable "subnet_priv_1" {
  description   = "ID of the priv subnet 1 from vpc_app1 module"
  type          = string
  default       = ""
}

variable "subnet_priv_2" {
  description   = "ID of the priv subnet 2 from vpc_app1 module"
  type          = string
  default       = ""
}

variable "app1_attachment_name" {
  description   = "Transit Gateway VPC Attachment name"
  type          = string
  default       = "transit-vpc-app1-attch"
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
