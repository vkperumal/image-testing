resource "aws_lb_listener" "alb" {
  count             = var.create_alb ? 1 : 0
  load_balancer_arn = element(aws_lb.alb.*.arn, count.index)
  port              = lookup(var.listener_options, "port", "443")
  protocol          = lookup(var.listener_options, "protocol", "HTTPS")
  ssl_policy        = lookup(var.listener_options, "ssl_policy", "")
  certificate_arn   = lookup(var.listener_options, "certificate_arn", "")

  default_action {
    type             = "forward"
    target_group_arn = element(aws_lb_target_group.alb_tg.*.arn, count.index)
  }
  tags = merge(
    local.common_tags,
    var.additional_tags,
    {
      Name = "${var.name}-listener"
    }
  )
}
