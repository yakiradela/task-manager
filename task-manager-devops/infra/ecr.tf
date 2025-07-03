resource "aws_ecr_repository" "task_api" {
  name                 = "task-api"
  image_tag_mutability = "MUTABLE"

  tags = {
    Environment = "production"
    Project     = "task-manager-devops"
  }
}
