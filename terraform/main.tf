module "tgw" {
  source  = "./modules/tgw/"
}

module "vpc_egress" {
  source              = "./modules/vpc_egress/"
  transit_gateway_id  = module.tgw.transit_gateway_id
  proxy1_ec2          = module.nat_proxy_ec2.proxy1_ec2
}

module "tgw_attach_egress" {
  source              = "./modules/tgw_attach_egress/"
  transit_gateway_id  = module.tgw.transit_gateway_id
  vpc_egress_id       = module.vpc_egress.vpc_egress_id
  subnet_priv_1       = module.vpc_egress.subnet_priv_1
  subnet_priv_2       = module.vpc_egress.subnet_priv_2
  subnet_priv_3       = module.vpc_egress.subnet_priv_3
}

module "nat_proxy_ec2" {
  source            = "./modules/nat_proxy_ec2/"
  eni_proxy1        = module.vpc_egress.eni_proxy1
  eni_proxy2        = module.vpc_egress.eni_proxy2
  eni_proxy3        = module.vpc_egress.eni_proxy3
  keyname           = var.keyname
}

module "vpc_app1" {
  source              = "./modules/vpc_app1/"
  transit_gateway_id  = module.tgw.transit_gateway_id
}

module "tgw_attach_app1" {
  source              = "./modules/tgw_attach_app1/"
  transit_gateway_id  = module.tgw.transit_gateway_id
  transit_rtb_id      = module.tgw_attach_egress.transit_rtb_id
  vpc_app1_id         = module.vpc_app1.vpc_app1_id
  subnet_priv_1       = module.vpc_app1.subnet_priv_app_1
  subnet_priv_2       = module.vpc_app1.subnet_priv_app_2
}

module "ec2_test" {
  source          = "./modules/ec2_test/"
  subnet_priv_1   = module.vpc_app1.subnet_priv_app_1
  subnet_priv_2   = module.vpc_app1.subnet_priv_app_2
  keyname           = var.keyname
}
