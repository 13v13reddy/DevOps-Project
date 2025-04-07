output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "pubsub_subnet_id" {
  description = "The ID of the pubsub subnet"
  value       = module.vpc.pubsub_subnet_id
}

output "bastion_ip" {
  description = "The public IP of the bastion host"
  value       = module.ec2_bastion.bastion_ip
}