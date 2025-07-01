module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    cluster_name    = var.cluster_name
    cluster_version = module.vpc.public_subnets
    vpc_id          = module.vpc.vpc_id  
}
