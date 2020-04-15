resource "aws_instance" "app_1" {
    subnet_id               = var.subnet_priv_1
    instance_type           = var.instance_type
    source_dest_check       = false
    key_name                = "cortega-key"
    ami                     = var.ami_id
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.app1_tag, local.standard_tags)
}

resource "aws_instance" "app_2" {
    subnet_id               = var.subnet_priv_2
    instance_type           = var.instance_type
    source_dest_check       = false
    key_name                = "cortega-key"
    ami                     = var.ami_id
    lifecycle {
        create_before_destroy = true
    }
    tags                    = merge(local.app2_tag, local.standard_tags)
}
