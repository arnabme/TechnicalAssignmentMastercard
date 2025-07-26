provider "aws" {
  region = var.region
}

module "vpc" {
  source    = "../../modules/vpc"
  env       = var.env
  vpc_cidr  = var.vpc_cidr
  azs       = var.azs
}

module "rds" {
  source         = "../../modules/rds"
  env            = var.env
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnet_ids
  db_username    = var.db_username
  db_password    = var.db_password
  db_name        = var.db_name
  allowed_cidrs  = var.allowed_cidrs
  multi_az       = false
  backup_retention_days = 5
}

module "efs" {
  source        = "../../modules/efs"
  env           = var.env
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  allowed_cidrs = var.allowed_cidrs
}

module "eks" {
  source          = "../../modules/eks"
  env             = var.env
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  cluster_version = var.cluster_version
}
