module "cluster" {
  source       = "../../modules/cluster"
  cluster_type = "eks" // Change to "ecs" if you want to create an ECS cluster
  cluster_name = "staging-cluster"

  ecs_cluster_settings = {
    name  = "containerInsights"
    value = "enabled"
  }

  eks_cluster_settings = {
    role_arn   = "arn:aws:iam::123456789012:role/StagingEKSRole"
    subnet_ids = ["subnet-stg123", "subnet-stg456"]
  }
}
