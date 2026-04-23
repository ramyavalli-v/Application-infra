module "alb" {
  source            = "../../modules/alb"
  name              = "${var.environment}-alb"
  vpc_id            = data.terraform_remote_state.core.outputs.vpc_id
  subnets           = data.terraform_remote_state.core.outputs.public_subnet_ids
  security_group_id = data.terraform_remote_state.core.outputs.security_group_ids.web
  tags              = local.common_tags
}

module "lt" {
  source            = "../../modules/launch-template"
  name              = "${var.environment}-app"
  instance_type     = local.env.instance_type
  security_group_id = data.terraform_remote_state.core.outputs.security_group_ids.app
  tags              = local.common_tags
}

module "asg" {
  source              = "../../modules/asg"
  name                = "${var.environment}-asg"
  subnets             = data.terraform_remote_state.core.outputs.private_app_subnet_ids
  launch_template_id  = module.lt.id
  desired_capacity    = local.env.desired_capacity
  min_size            = local.env.min_size
  max_size            = local.env.max_size
  target_group_arn   = module.alb.target_group_arn
  tags                = local.common_tags
}

module "rds" {
  source             = "../../modules/rds"
  name               = "${var.environment}-postgres"
  instance_class     = local.env.db_instance_class
  subnets            = data.terraform_remote_state.core.outputs.private_db_subnet_ids
  security_group_id  = data.terraform_remote_state.core.outputs.security_group_ids.db
  tags               = local.common_tags
}


# module "route53" {
#   source       = "../../modules/route53"
#   zone_id      = local.env.hosted_zone_id
#   domain_name  = local.env.domain_name
#   alb_dns      = module.alb.dns_name
#   alb_zone_id  = module.alb.zone_id
# }


module "s3" {
  source      = "../../modules/s3"
  bucket_name = local.env.s3_bucket_name
  tags        = local.common_tags
}