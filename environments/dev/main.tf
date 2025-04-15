# VPC module
module "vpc" {
  source             = "../../modules/vpc"
  project_name       = var.project_name
  cidr_block         = var.cidr_block
  azs                 = var.azs  # Match the variable name 'azs'
  public_subnet_cidrs = var.public_subnet_cidrs  # Match the variable name 'public_subnet_cidrs'
  private_subnet_cidrs = var.private_subnet_cidrs  # Match the variable name 'private_subnet_cidrs'
  vpc_name            = var.vpc_name  # Make sure this is passed
}

# EKS module
module "eks" {
  source                       = "../../modules/eks"
  public_subnet_ids            = module.vpc.public_subnet_ids
  vpc_id                       = module.vpc.vpc_id
  cluster_name                 = var.cluster_name
  kubernetes_version           = var.kubernetes_version
  max_session_duration_cluster = var.max_session_duration_cluster

  eks_worker_node               = var.eks_worker_node
  instance_type                 = var.instance_type
  desired_capacity              = var.desired_capacity
  max_size                      = var.max_size
  min_size                      = var.min_size
  on_demand_base_capacity       = var.on_demand_base_capacity
  on_demand_percentage          = var.on_demand_percentage
  spot_max_price                = var.spot_max_price
  key_name                      = var.key_name
  github_actions_terraform_role = var.github_actions_terraform_role
}