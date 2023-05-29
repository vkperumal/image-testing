module "testapp_ecs" {
  source = "../../terraform/modules/ecs"

  name        = "staging-corp-alb"
  environment = module.common_variables.environment
  create_alb  = true
  vpc_id      = module.common_variables.vpc_id
  subnet_type = "public"
  sg_options = {
    port      = "80"
    protocol  = "tcp"
    cidr_list = "0.0.0.0/0"
  }
  tg_options = {
    port        = "5075"
    protocol    = "HTTP"
    health_path = "/"
  }
  listener_options = {
    protocol        = "HTTP"
    port            = "80"
    # certificate_arn = "arn:aws:acm:ap-south-1:269617500572:certificate/e13465a2-0d84-4f5c-a8af-c15a20bbb78a"
    # ssl_policy      = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  }
  lb_options = {
    internal = false
  }
  ecs_options = {
    name = "testapp-service"
    cluster = "testapp"
    task_definition = var.task_definition
    iam_role = ""
    container_name = "testApp-dev-80-tcp"
    container_port = 5075
  }
}