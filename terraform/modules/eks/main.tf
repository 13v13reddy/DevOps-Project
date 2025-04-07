module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.8.4"
  cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    subnet_ids = var.subnet_ids
    vpc_id = var.vpc_id
    enable_irsa = true
    eks_managed_node_groups = {
        default = {
            desired_capacity = 2
            max_size = 3
            min_size = 1
            instance_type = var.instance_type
            key_name = var.key_name
            ami_type = "AL2_x86_64"
            volume_size = 20
            tags = {
                Name = "${var.name}-eks-node"
            }
        }
    }
}