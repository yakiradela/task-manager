variable "cluster_name" {
    default = "task-cluster"
}


variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "task-api"
}
