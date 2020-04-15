locals {
  standard_tags = {
    Application   = var.application
    Team          = var.team_name
    Email         = var.team_email
  }

  vpc_tag = {
    Name  = var.vpc_name
  }

  igw_tag = {
    Name  = var.igw_name
  }

  sg_inbound_tag = {
    Name  = var.sg_inbound_name
  }

  sg_internal_tag = {
    Name  = var.sg_internal_name
  }

  sub_priv_tag = {
    Name  = var.sub_priv_name
  }

  sub_pub_tag = {
    Name  = var.sub_pub_name
  }

  proxy_1_eth1_tag = {
    Name  = var.proxy_1_eth1_name
  }

  proxy_1_pub_tag = {
    Name  = var.proxy_1_pub_name
  }

  proxy_2_eth1_tag = {
    Name  = var.proxy_2_eth1_name
  }

  proxy_2_pub_tag = {
    Name  = var.proxy_2_pub_name
  }

  proxy_3_eth1_tag = {
    Name  = var.proxy_3_eth1_name
  }

  proxy_3_pub_tag = {
    Name  = var.proxy_3_pub_name
  }

  pub_rtb_tag = {
    Name  = var.pub_rtb_name
  }

  pri_rtb1_tag = {
    Name  = var.pri_rtb1_name
  }

  pri_rtb2_tag = {
    Name  = var.pri_rtb2_name
  }

  pri_rtb3_tag = {
    Name  = var.pri_rtb3_name
  }

}
