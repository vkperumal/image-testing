<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.ecs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cidr_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ecs_cidr_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ecs_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ecs_sg_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_availability_zones.zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_ecs_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_cluster) | data source |
| [aws_subnet_ids.private_subnet_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.subnet_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional Tags | `map(string)` | `{}` | no |
| <a name="input_create_alb"></a> [create\_alb](#input\_create\_alb) | Boolean to create ALB | `bool` | `false` | no |
| <a name="input_create_alb_tg"></a> [create\_alb\_tg](#input\_create\_alb\_tg) | Boolean to create ALB Target Group | `bool` | `false` | no |
| <a name="input_ecs_options"></a> [ecs\_options](#input\_ecs\_options) | ECS Options | `map(string)` | n/a | yes |
| <a name="input_lb_options"></a> [lb\_options](#input\_lb\_options) | Load Balancer Options | `map(string)` | n/a | yes |
| <a name="input_listener_options"></a> [listener\_options](#input\_listener\_options) | Listener Options | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | name of the instance | `string` | n/a | yes |
| <a name="input_sg_options"></a> [sg\_options](#input\_sg\_options) | Security Options for the ALB | `map(any)` | n/a | yes |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Subnets on which ALB will be created | `string` | n/a | yes |
| <a name="input_tg_options"></a> [tg\_options](#input\_tg\_options) | Target Group Options | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID on which instance will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb"></a> [alb](#output\_alb) | ALB details |
| <a name="output_alb_listener"></a> [alb\_listener](#output\_alb\_listener) | ALB Listener |
| <a name="output_alb_target_group"></a> [alb\_target\_group](#output\_alb\_target\_group) | ALB target group details |
| <a name="output_sg"></a> [sg](#output\_sg) | Security Group details |
<!-- END_TF_DOCS -->