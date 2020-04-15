locals {
  standard_tags = {
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }

  app1_tag = {
    Name   = var.app1_name
  }

  app2_tag = {
    Name   = var.app2_name
  }

}
