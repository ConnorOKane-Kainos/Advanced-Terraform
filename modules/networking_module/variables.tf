variable "region" {
  type        = string
  description = "Deployment region for this module"
}

variable "project" {
  type        = string
  description = "Project Name"
}

variable "environment" {
  type        = string
  description = "Deployment environment for this module"
}

variable "internal_domain_name" {
  type        = string
  description = "Internal domain name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets."
}

variable "nat_gateway_count" {
  type        = number
  description = "Number of NAT Gateways"
}

variable "module_nat_gateway_count" {
  description = "Number of NAT gateways to create."
  type        = number
  default     = 1  # or any other default value you'd like to set
}