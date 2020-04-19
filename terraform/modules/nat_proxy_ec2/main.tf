data "aws_ami" "proxy_ami" {
  most_recent = true
  owners = ["self"]
  tags = {
    Name   = "ami-transp-proxy"
    Team   = "Cloud-AWS"
  }
}

resource "aws_instance" "nat_proxy_1" {
    instance_type           = var.instance_type
    key_name                = var.keyname
    ami                     = data.aws_ami.proxy_ami.id
    network_interface {
      network_interface_id  = var.eni_proxy1
      device_index          = 0
    }
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_1_tag, local.standard_tags)
}

resource "aws_instance" "nat_proxy_2" {
    instance_type           = var.instance_type
    key_name                = var.keyname
    ami                     = data.aws_ami.proxy_ami.id
    network_interface {
      network_interface_id  = var.eni_proxy2
      device_index          = 0
    }
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_2_tag, local.standard_tags)
}

resource "aws_instance" "nat_proxy_3" {
    instance_type           = var.instance_type
    key_name                = var.keyname
    ami                     = data.aws_ami.proxy_ami.id
    network_interface {
      network_interface_id  = var.eni_proxy3
      device_index          = 0
    }
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_3_tag, local.standard_tags)
}
