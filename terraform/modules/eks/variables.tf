variable "name" {
  
}
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}
variable "cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
variable "instance_type" {
  description = "Instance type for the EKS nodes"
  type        = string
}
variable "key_name" {
  description = "Key name for the EKS nodes"
  type        = string
}

variable "tags" {
  
}