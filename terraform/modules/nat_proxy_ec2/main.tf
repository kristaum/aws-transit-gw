resource "aws_instance" "nat_proxy_1" {
    subnet_id               = var.subnet_priv_1
    instance_type           = var.instance_type
    source_dest_check       = false
    key_name                = "cortega-key"
    vpc_security_group_ids  = [ var.sg_eth0_egress ]
    ami                     = var.ami_id
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_1_tag, local.standard_tags)
}

resource "aws_network_interface_attachment" "eni_nat_proxy_1" {
  instance_id          = aws_instance.nat_proxy_1.id
  network_interface_id = var.eni_proxy1
  device_index         = 1
}

resource "aws_instance" "nat_proxy_2" {
    subnet_id               = var.subnet_priv_2
    instance_type           = var.instance_type
    source_dest_check       = false
    key_name                = "cortega-key"
    vpc_security_group_ids  = [ var.sg_eth0_egress ]
    ami                     = var.ami_id
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_2_tag, local.standard_tags)
}

resource "aws_network_interface_attachment" "eni_nat_proxy_2" {
  instance_id          = aws_instance.nat_proxy_2.id
  network_interface_id = var.eni_proxy2
  device_index         = 1
}

resource "aws_instance" "nat_proxy_3" {
    subnet_id               = var.subnet_priv_3
    instance_type           = var.instance_type
    source_dest_check       = false
    key_name                = "cortega-key"
    vpc_security_group_ids  = [ var.sg_eth0_egress ]
    ami                     = var.ami_id
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.nat_proxy_3_tag, local.standard_tags)
}

resource "aws_network_interface_attachment" "eni_nat_proxy_3" {
  instance_id          = aws_instance.nat_proxy_3.id
  network_interface_id = var.eni_proxy3
  device_index         = 1
}
