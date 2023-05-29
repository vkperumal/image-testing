data "aws_availability_zones" "zones" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet_ids" "subnet_list" {
  vpc_id = var.vpc_id
}

locals {
  common_tags = {
    Name        = var.name
    Created_by  = "terraform"
  }
}

resource "aws_lb" "alb" {
  count              = var.create_alb ? 1 : 0
  name               = var.name
  load_balancer_type = "application"
  internal           = lookup(var.lb_options, "internal", true)
  security_groups    = [element(aws_security_group.sg.*.id, count.index)]
  subnets            = tolist(data.aws_subnet_ids.subnet_list.ids)

  idle_timeout                     = lookup(var.lb_options, "idle_timeout", "120")
  enable_cross_zone_load_balancing = lookup(var.lb_options, "enable_cross_zone_load_balancing", false)
  enable_deletion_protection       = lookup(var.lb_options, "enable_deletion_protection", false)
  drop_invalid_header_fields       = lookup(var.lb_options, "drop_invalid_header_fields", false)

  access_logs {
    bucket  = lookup(var.lb_options, "bucket", "")
    prefix  = lookup(var.lb_options, "prefix", "")
    enabled = lookup(var.lb_options, "enable_access_logs", false)
  }

  tags = merge(
    local.common_tags,
    var.additional_tags
  )
}
