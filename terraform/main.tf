module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  name = var.name
  pubsub_cidr = var.pubsub_cidr
  availability_zone = var.availability_zone
}

module "ec2_bastion" {
  source = "./modules/ec2_bastion"
  name = var.name
  pubsub_subnet_id = module.vpc.pubsub_subnet_id
  vpc_id = module.vpc.vpc_id
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  availability_zone = var.availability_zone
}