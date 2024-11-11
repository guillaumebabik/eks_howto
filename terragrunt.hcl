# terragrunt.hcl for the root configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules/${path_relative_to_include()}"
}

dependencies {
  paths = ["../vpc", "../iam", "../autoscaling", "../monitoring"]
}

inputs = {
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  vpc_id          = "vpc-123456"  # À ajuster en fonction du VPC généré
  subnets         = ["subnet-123456", "subnet-654321"]  # À ajuster avec les sous-réseaux générés
}
