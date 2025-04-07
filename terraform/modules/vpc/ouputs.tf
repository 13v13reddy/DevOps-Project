output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "pubsub_subnet_id" {
  description = "The ID of the pubsub subnet"
  value       = aws_subnet.pubsub.id
}