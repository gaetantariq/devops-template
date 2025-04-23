module "cluster" {
  source       = "../../modules/cluster"
  cluster_type = "ecs" // Change to "eks" if you want to create an EKS cluster
  cluster_name = "dev-cluster"

  ecs_cluster_settings = {
    name  = "containerInsights"
    value = "enabled"
  }

  eks_cluster_settings = {
    role_arn   = "arn:aws:iam::123456789012:role/EKSRole"
    subnet_ids = ["subnet-abc123", "subnet-def456"]
  }
}
