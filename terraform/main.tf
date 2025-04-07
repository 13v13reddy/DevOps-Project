module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  name               = var.name
  pubsub_cidr        = var.pubsub_cidr
  prisub1_cidr       = var.prisub1_cidr
  prisub2_cidr       = var.prisub2_cidr
  availability_zone  = var.availability_zone
  availability_zone2 = var.availability_zone2
  tags               = var.tags
}

module "ec2_bastion" {
  source            = "./modules/ec2_bastion"
  name              = var.name
  pubsub_subnet_id  = module.vpc.pubsub_subnet_id
  vpc_id            = module.vpc.vpc_id
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  tags              = var.tags
}

module "eks" {
  source          = "./modules/eks"
  name            = var.name
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = [module.vpc.prisub1_subnet_id, module.vpc.prisub2_subnet_id]
  vpc_id          = module.vpc.vpc_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  tags            = var.tags
}