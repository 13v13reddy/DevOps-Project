variable "aws_region" {
  description = "AWS region to deploy the VPC"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name of the VPC"
  type        = string
  default = "TestVPC"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pubsub_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  default = "ami-084568db4383264d4" # Example AMI ID, replace with a valid one
}

variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  description = "Key pair name for the EC2 instance"
  type        = string
  default     = "server" # Replace with your key pair name
}