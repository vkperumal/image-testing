output "alb" {
  value = module.alb.alb[0].dns_name
}