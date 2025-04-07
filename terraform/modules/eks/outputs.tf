output "EKS_DNS" {
  value = module.eks.cluster_endpoint
  description = "The DNS name for the EKS cluster."
}
