
provider "aws" {
   region = var.region
 }


terraform {
  required_providers {
    aws = "~> 3.21"
  }
}

module "networking" {
  source = "./modules/networking"

  env = var.env
  
  vpc_name = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
  vpc_enable_dns_support = var.vpc_enable_dns_support
  vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
  subnets = var.subnets
  igw_name = var.igw_name
}

module "securitygroup" {
  source = "./modules/securitygroup"

  env = var.env
  vpc_id = module.networking.vpc_id
  security_group_name = var.security_group_name
  security_group_configs = var.security_group_configs
}

module "autoscaling" {
  source = "./modules/autoscaling"

  env = var.env
  vpc_zone_identifier = module.networking.vpc_zone_identifier
  security_groups = module.securitygroup.security_groups
  autoscaling_group_name = var.autoscaling_group_name
  autoscaling_group_configs = var.autoscaling_group_configs
}

module "ecs" {
  source = "./modules/ecs"

  env = var.env
  auto_scaling_group_arn = module.autoscaling.auto_scaling_group_arn
  cluster_name = var.cluster_name
  cluster_group_provider_configs = var.cluster_group_provider_configs
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  env = var.env
  vpc_id = module.networking.vpc_id
  subnets_public = module.networking.subnets_public
  loadbalancer_name = var.loadbalancer_name
  loadbalancer_configs = var.loadbalancer_configs
  loadbalancer_target_group_config = var.loadbalancer_target_group_config
  loadbalancer_listener_config = var.loadbalancer_listener_config
}