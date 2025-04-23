module "cluster" {
  source       = "../../modules/cluster"
  cluster_type = "eks" // Change to "ecs" if you want to create an ECS cluster
  cluster_name = "prod-cluster"

  ecs_cluster_settings = {
    name  = "containerInsights"
    value = "enabled"
  }

  eks_cluster_settings = {
    role_arn   = "arn:aws:iam::123456789012:role/ProdEKSRole"
    subnet_ids = ["subnet-xyz789", "subnet-uvw123"]
  }
}
