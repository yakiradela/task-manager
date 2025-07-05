module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name               = "task-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.21.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # לא מגדירים node_groups פה
}

module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "18.29.0"

  cluster_name    = module.eks.cluster_id
  cluster_version = "1.27"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  cluster_security_group_id         = module.eks.node_security_group_id

  min_size     = 1
  max_size     = 3
  desired_size = 2

  instance_types = ["t3.medium"]
  capacity_type  = "ON_DEMAND"

  labels = {
    Environment = "dev"
  }
}
