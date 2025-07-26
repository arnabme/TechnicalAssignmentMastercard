module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"  # Use the latest stable version

  cluster_name    = "${var.env}-eks"
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  tags = {
    Environment = var.env
    Terraform   = "true"
  }

  eks_managed_node_groups = {
    default = {
      name           = "${var.env}-node-group"
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2

      labels = {
        Environment = var.env
      }

      tags = {
        Name = "${var.env}-eks-node"
      }
    }
  }

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
}
