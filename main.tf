provider "aws" {
  region = var.region
}

# VPC Module
module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  pub_subnet_cidrs     = var.pub_subnet_cidrs
  pvt_subnet_cidrs     = var.pvt_subnet_cidrs
  pub_azs              = var.pub_azs
  pvt_azs              = var.pvt_azs
  allowed_ingress_cidr = var.allowed_ingress_cidr
}

module "eks" {
  source             = "./modules/eks"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  subnet_ids         = concat(module.network.public_subnet_ids, module.network.private_subnet_ids)
  ecr_repository_url = var.ecr_repository_url
}
