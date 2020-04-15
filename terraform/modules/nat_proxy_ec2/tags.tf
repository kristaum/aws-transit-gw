locals {
  standard_tags = {
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }

  nat_proxy_1_tag = {
    Name   = var.nat_proxy_1_name
  }

  nat_proxy_2_tag = {
    Name   = var.nat_proxy_2_name
  }

  nat_proxy_3_tag = {
    Name   = var.nat_proxy_3_name
  }

}
