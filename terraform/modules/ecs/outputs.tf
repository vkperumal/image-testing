output "sg" {
  description = "Security Group details"
  value       = aws_security_group.sg
}

output "alb" {
  description = "ALB details"
  value       = aws_lb.alb
}

output "alb_target_group" {
  description = "ALB target group details"
  value       = aws_lb_target_group.alb_tg
}

output "alb_listener" {
  description = "ALB Listener"
  value       = aws_lb_listener.alb
}
