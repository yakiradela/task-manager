module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "task-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "16.0.0"  # לדוגמה

  cluster_name    = var.cluster_name
  cluster_version = "1.21"

  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_desired_capacity = 2
    }
  ]
}
