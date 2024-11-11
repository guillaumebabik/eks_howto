# terragrunt.hcl for EKS Cluster
include {
  path = find_in_parent_folders()
}

terraform {
  source = "./modules/eks_cluster" # chemin vers votre module EKS
}

inputs = {
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  vpc_id          = "vpc-123456"
  subnets         = ["subnet-123456", "subnet-654321"]
}
