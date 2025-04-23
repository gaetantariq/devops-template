variable "cluster_type" {
  description = "Type of cluster to create: ecs or eks"
  type        = string
  default     = "ecs"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "ecs_cluster_settings" {
  description = "Settings for the ECS cluster"
  type        = map(any)
  default     = {}
}

variable "eks_cluster_settings" {
  description = "Settings for the EKS cluster"
  type        = map(any)
  default     = {}
}

resource "aws_ecs_cluster" "ecs" {
  count = var.cluster_type == "ecs" ? 1 : 0
  name  = var.cluster_name

  // ...existing code for ECS cluster settings...
  settings {
    name  = lookup(var.ecs_cluster_settings, "name", null)
    value = lookup(var.ecs_cluster_settings, "value", null)
  }
}

resource "aws_eks_cluster" "eks" {
  count = var.cluster_type == "eks" ? 1 : 0
  name  = var.cluster_name

  // ...existing code for EKS cluster settings...
  role_arn = lookup(var.eks_cluster_settings, "role_arn", null)

  vpc_config {
    subnet_ids = lookup(var.eks_cluster_settings, "subnet_ids", [])
  }
}
