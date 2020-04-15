variable "cidr" {
  description   = "CIDR of the VPC"
  type          = string
  default       = "10.161.0.0/25"
}

variable "priv_app_sub_1" {
  description   = "CIDR of the priv subnet 1"
  type          = string
  default       = "10.161.0.0/28"
}

variable "priv_app_sub_2" {
  description   = "CIDR of the priv subnet 2"
  type          = string
  default       = "10.161.0.16/28"
}

variable "transit_gateway_id" {
  description   = "Transit Gateway ID created from tgw module"
  type          = string
  default       = ""
}

variable "vpc_name" {
  description   = "VPC APP 1 name"
  type          = string
  default       = "vpc-app1"
}

variable "priv_app_sub_1_name" {
  description   = "Private subnet name 1"
  type          = string
  default       = "priv_app_sub_1"
}

variable "priv_app_sub_2_name" {
  description   = "Private subnet name 2"
  type          = string
  default       = "priv_app_sub_2"
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
