# VPC variables
variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "project_name" {
  type        = string
  description = "The project name"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones to use for the subnets"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
}


# EKS variables
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version one release prior to the latest supported by EKS"
  type        = string
}

variable "max_session_duration_cluster" {
  description = "Maximum session duration for cluster role"
  type        = number
}

variable "eks_worker_node" {
  description = "Name for the EKS worker nodes"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the worker nodes in the launch template"
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling Group for the worker nodes"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances the Auto Scaling Group can scale to"
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances the Auto Scaling Group should maintain"
  type        = number
}

variable "on_demand_base_capacity" {
  description = "The minimum number of On-Demand instances in the Auto Scaling Group"
  type        = number
}

variable "on_demand_percentage" {
  description = "The percentage of instances above the base capacity that should be On-Demand"
  type        = number
}

variable "spot_max_price" {
  description = "The maximum price to pay per hour for Spot instances"
  type        = string
}

variable "key_name" {
  description = "SSH key for worker nodes"
  type        = string
}

variable "github_actions_terraform_role" {
  description = "GitHub Actions Terraform Role Name"
  type        = string
}
variable "cloudwatch_addon_role_arn" {
  description = "IAM role ARN for CloudWatch Observability add-on"
  type        = string
}
