variable "project_name" {
  type        = string
  description = "The project name"
}


variable "vpc_name" {
  description = "Name tag for the VPC and related resources"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of Availability Zones for subnets (e.g., us-west-2a, us-west-2b, us-west-2c)"
  type        = list(string)
  validation {
    condition     = length(var.azs) == 3
    error_message = "You must provide exactly 3 Availability Zones."
  }
}

variable "public_subnet_cidrs" {
  description = "List of 3 CIDR blocks for public subnets"
  type        = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) == 3
    error_message = "You must provide exactly 3 public subnet CIDRs."
  }
}

variable "private_subnet_cidrs" {
  description = "List of 3 CIDR blocks for private subnets"
  type        = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) == 3
    error_message = "You must provide exactly 3 private subnet CIDRs."
  }
}
