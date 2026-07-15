# Production-ready EKS module with Fargate profiles
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  
  vpc_config {
    subnet_ids = var.subnet_ids
    enable_dns_hostnames = true
  }
  
  encryption_config {
    provider {
      key_arn = aws_kms_key.cluster.arn
    }
    resources = ["secrets"]
  }
}

# Fargate profile for serverless computing
resource "aws_eks_fargate_profile" "serverless" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "serverless"
  pod_execution_role_arn = aws_iam_role.fargate.arn
  subnet_ids             = var.subnet_ids
  
  selector {
    namespace = "default"
    labels    = { "workload-type" = "serverless" }
  }
}