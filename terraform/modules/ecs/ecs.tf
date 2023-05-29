data "aws_ecs_cluster" "cluster" {
  cluster_name = lookup(var.ecs_options, "cluster_name")
}

data "aws_subnet_ids" "private_subnet_list" {
  vpc_id = var.vpc_id
  tags = {
    Name = "*private*"
  }
}

resource "aws_ecs_service" "service" {
  name            = lookup(var.ecs_options, "name", var.name)
  cluster         = data.aws_ecs_cluster.cluster.id
  task_definition = lookup(var.ecs_options, "task_definition")
  desired_count   = lookup(var.ecs_options, "count", 2)
  # iam_role        = lookup(var.ecs_options, "iam_role")

  load_balancer {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    container_name   = lookup(var.ecs_options, "container_name") 
    container_port   = lookup(var.ecs_options, "container_port") 
  }

  network_configuration {
    subnets = tolist(data.aws_subnet_ids.private_subnet_list.ids)
    assign_public_ip = false
    security_groups    = [aws_security_group.ecs_sg.id]
  }
}