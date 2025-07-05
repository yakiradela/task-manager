variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "task-cluster"
}


variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "task-api"
}
