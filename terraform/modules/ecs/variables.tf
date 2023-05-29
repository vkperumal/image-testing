variable "name" {
  description = "name of the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID on which instance will be deployed"
  type        = string
}

variable "subnet_type" {
  description = "Subnets on which ALB will be created"
  type        = string
}

variable "sg_options" {
  description = "Security Options for the ALB"
  type        = map(any)
}

variable "lb_options" {
  description = "Load Balancer Options"
  type        = map(string)
}

variable "create_alb" {
  description = "Boolean to create ALB"
  type        = bool
  default     = false
}


variable "create_alb_tg" {
  description = "Boolean to create ALB Target Group"
  type        = bool
  default     = false
}

variable "tg_options" {
  description = "Target Group Options"
  type        = map(string)
}

variable "listener_options" {
  description = "Listener Options"
  type        = map(string)
}

variable "ecs_options" {
  description = "ECS Options"
  type        = map(string)
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional Tags"
  default     = {}
}
