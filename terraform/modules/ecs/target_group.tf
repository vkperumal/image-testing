resource "aws_lb_target_group" "alb_tg" {
  count                         = var.create_alb ? 1 : var.create_alb_tg ? 1 : 0
  name                          = "${var.name}-tg"
  vpc_id                        = var.vpc_id
  load_balancing_algorithm_type = lookup(var.tg_options, "load_balancing_algorithm_type", "round_robin")
  port                          = lookup(var.tg_options, "port")
  deregistration_delay          = lookup(var.tg_options, "deregistration_delay", "300")
  preserve_client_ip            = lookup(var.tg_options, "preserve_client_ip", null)
  protocol                      = lookup(var.tg_options, "protocol", "HTTP")
  protocol_version              = lookup(var.tg_options, "protocol_version", "HTTP1")
  slow_start                    = lookup(var.tg_options, "slow_start", "0")
  target_type                   = lookup(var.tg_options, "target_type", "instance")
  health_check {
    enabled             = true
    healthy_threshold   = lookup(var.tg_options, "healthy_threshold", "2")
    interval            = lookup(var.tg_options, "interval", "15")
    path                = lookup(var.tg_options, "health_path")
    port                = lookup(var.tg_options, "health_port", lookup(var.tg_options, "port"))
    matcher             = lookup(var.tg_options, "matcher", "200")
    protocol            = lookup(var.tg_options, "protocol", "HTTP")
    timeout             = lookup(var.tg_options, "timeout", "10")
    unhealthy_threshold = lookup(var.tg_options, "unhealthy_threshold", "3")
  }
  tags = merge(
    local.common_tags,
    var.additional_tags,
    {
      Name = "${var.name}-tg"
    }
  )
}
