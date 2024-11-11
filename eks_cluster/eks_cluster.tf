# eks_cluster.tf
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  subnets         = [for subnet in aws_subnet.eks_subnets : subnet.id]  # Référence des sous-réseaux
  vpc_id          = aws_vpc.eks_vpc.id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "my-key-pair"
    }
  }

  manage_aws_auth = true
}
