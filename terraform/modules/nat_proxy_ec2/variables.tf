variable "instance_type" {
  description   = ""
  type          = string
  default       = "t2.micro"
}

variable "keyname" {
  description   = "Key that will be used to login to ec2 intances"
  type          = string
  default       = ""
}

variable "eni_proxy1" {
  description   = ""
  type          = string
  default       = ""
}

variable "eni_proxy2" {
  description   = ""
  type          = string
  default       = ""
}

variable "eni_proxy3" {
  description   = ""
  type          = string
  default       = ""
}

variable "nat_proxy_1_name" {
  description   = ""
  type          = string
  default       = "nat_transp_proxy_1"
}

variable "nat_proxy_2_name" {
  description   = ""
  type          = string
  default       = "nat_transp_proxy_2"
}

variable "nat_proxy_3_name" {
  description   = ""
  type          = string
  default       = "nat_transp_proxy_3"
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
