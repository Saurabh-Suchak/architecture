provider "aws" {
  region = var.region
}

module "networking" {
  source = "./modules/networking"
}

module "s3" {
  source = "./modules/s3"
}

module "ecs" {
  source = "./modules/ecs"
}

module "ec2" {
  source      = "./modules/ec2"
  vpc_id      = module.networking.vpc_id
  subnet_id   = module.networking.public_subnet_ids[0]
  instance_ami = var.instance_ami
  instance_type = var.instance_type
}

module "secrets" {
  source = "./modules/secrets"
}

module "waf" {
  source = "./modules/waf"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "db" {
  source = "./modules/db"
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}



output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}


output "ec2_instance_public_ip" {
  value = module.ec2.instance_public_ip
}
output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.db.db_endpoint
}


output "db_name" {
  value = module.db.db_name
}



output "waf_acl_arn" {
  value = module.waf.web_acl_arn
}

output "waf_acl_name" {
  value = module.waf.web_acl_name
}

output "secrets_arn" {
  value = module.secrets.secrets_arn
}

output "secrets_name" {
  value = module.secrets.secrets_name
}

output "log_group_name" {
  value = module.monitoring.log_group_name
}

output "alarm_name" {
  value = module.monitoring.alarm_name
}

