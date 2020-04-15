variable "aws_asn" {
  description   = "ASN for the Transit Gateway"
  type          = number
  default       = 64550
}

variable "auto_accept_shared_attachments" {
  description   = "Allow resource attachment automatically"
  type          = string
  default       = "enable"
}

variable "default_route_table_association" {
  description   = "Disable association with default route table"
  type          = string
  default       = "disable"
}

variable "default_route_table_propagation" {
  description   = "Disable resource attachments to automatically propagate routes"
  type          = string
  default       = "disable"
}

variable "dns_support" {
  description   = "Make sure DNS support is enabled"
  type          = string
  default       = "enable"
}

variable "tgw_name" {
  description   = "Transit Gateway Name"
  type          = string
  default       = "tgw-terraform"
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
