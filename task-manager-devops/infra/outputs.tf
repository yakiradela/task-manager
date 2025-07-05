output "cluster_endpoint" {
    value = module.eks.cluster_endpoint
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.task_api.repository_url
}

output "cluster_name" {
  value = module.eks.cluster_id
}
