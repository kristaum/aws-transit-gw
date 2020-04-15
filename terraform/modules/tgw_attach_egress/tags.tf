locals {
  standard_tags = {
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }

  egress_rtb_tag = {
    Name   = var.egress_rtb_name
  }

  egress_attachment_tag = {
    Name   = var.egress_attachment_name
  }

}
