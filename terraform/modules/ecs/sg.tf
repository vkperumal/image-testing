locals {
  cidr_list = split(",", lookup(var.sg_options, "cidr_list", ""))
  sg_list   = split(",", lookup(var.sg_options, "sg_list", ""))
  ecs_cidr_list = split(",", lookup(var.ecs_options, "cidr_list", ""))
  ecs_sg_list   = split(",", lookup(var.ecs_options, "sg_list", ""))
}

resource "aws_security_group" "sg" {
  count       = var.create_alb ? 1 : 0
  name        = "${var.name}-sg"
  description = "${var.name} Security group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.common_tags,
    var.additional_tags,
    {
      Name = "${var.name}-sg"
    }
  )
}

resource "aws_security_group_rule" "egress" {
  count             = var.create_alb ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.sg.*.id, count.index)
}

resource "aws_security_group_rule" "cidr_list" {
  count             = var.create_alb && lookup(var.sg_options, "cidr_list", "") != "" ? length(local.cidr_list) : 0
  type              = "ingress"
  from_port         = lookup(var.sg_options, "port", "443")
  to_port           = lookup(var.sg_options, "port", "443")
  protocol          = lookup(var.sg_options, "protocol", "tcp")
  security_group_id = aws_security_group.sg.0.id
  cidr_blocks       = [local.cidr_list[count.index]]
}

resource "aws_security_group_rule" "sg_list" {
  count                    = var.create_alb && lookup(var.sg_options, "sg_list", "") != "" ? length(local.sg_list) : 0
  type                     = "ingress"
  from_port                = lookup(var.sg_options, "port", "443")
  to_port                  = lookup(var.sg_options, "port", "443")
  protocol                 = lookup(var.sg_options, "protocol", "tcp")
  security_group_id        = aws_security_group.sg.0.id
  source_security_group_id = local.sg_list[count.index]
}

resource "aws_security_group" "ecs_sg" {
  name        = "${var.name}-ecs-sg"
  description = "${var.name} Security group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.common_tags,
    var.additional_tags,
    {
      Name = "${var.name}-ecs-sg"
    }
  )
}

resource "aws_security_group_rule" "ecs_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = element(aws_security_group.ecs_sg.*.id, count.index)
}

resource "aws_security_group_rule" "ecs_cidr_list" {
  count             = lookup(var.ecs_options, "cidr_list", "") != "" ? length(local.ecs_cidr_list) : 0
  type              = "ingress"
  from_port         = lookup(var.ecs_options, "container_port", "443")
  to_port           = lookup(var.ecs_options, "container_port", "443")
  protocol          = lookup(var.ecs_options, "protocol", "tcp")
  security_group_id = aws_security_group.ecs_sg.0.id
  cidr_blocks       = [local.cidr_list[count.index]]
}

resource "aws_security_group_rule" "ecs_sg_list" {
  count                    = lookup(var.ecs_options, "sg_list", "") != "" ? length(local.ecs_sg_list) : 0
  type                     = "ingress"
  from_port                = lookup(var.ecs_options, "container_port", "443")
  to_port                  = lookup(var.ecs_options, "container_port", "443")
  protocol                 = lookup(var.ecs_options, "protocol", "tcp")
  security_group_id        = aws_security_group.ecs_sg.0.id
  source_security_group_id = local.sg_list[count.index]
}