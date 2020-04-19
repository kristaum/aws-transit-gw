variable "instance_type" {
  description   = ""
  type          = string
  default       = "t2.micro"
}

variable "ami_id" {
  description   = ""
  type          = string
  default       = "ami-0323c3dd2da7fb37d"
}

variable "keyname" {
  description   = "Key that will be used to login to ec2 intances"
  type          = string
  default       = ""
}

variable "subnet_priv_1" {
  description   = ""
  type          = string
  default       = ""
}

variable "subnet_priv_2" {
  description   = ""
  type          = string
  default       = ""
}

variable "app1_name" {
  description   = ""
  type          = string
  default       = "app1_instance"
}

variable "app2_name" {
  description   = ""
  type          = string
  default       = "app2_instance"
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
