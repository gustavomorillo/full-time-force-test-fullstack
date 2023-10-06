
module "elastic_beanstalk" {
  source = "./modules/elastic-beanstalk"

  vpc_id                 = var.vpc_id
  vpc_public_subnets_ids = [var.subnet_one, var.subnet_two]
  vpc_cidr               = var.vpc_cidr
  instance_type          = var.instance_type_backend
  instance_keypair       = var.instance_keypair
  app_name               = var.app_name_node
  description            = var.description_app
  notification_email     = var.notification_email
  tags                   = var.elastic_beanstalk_tags
  BACKEND_DOMAIN_VAR     = var.BACKEND_DOMAIN
  security_group         = var.security_group
  GIT_REPO_URL           = var.GIT_REPO_URL

}
