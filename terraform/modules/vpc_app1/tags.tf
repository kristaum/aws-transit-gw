locals {
  standard_tags = {
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }

  vpc_tag = {
    Name  = var.vpc_name
  }

  priv_app_sub_1_tag = {
    Name  = var.priv_app_sub_1_name
  }

  priv_app_sub_2_tag = {
    Name  = var.priv_app_sub_2_name
  }

}
