variable "aws_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

# variable "vpc_id" {
#   type = string
# }

# variable "public_subnets_ids" {
#   type = list(string)
# }

# variable "private_subnets_ids" {
#   type = list(string)
# }

variable "web_instance_count" {
  type    = number
  default = 1
}

variable "web_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "mgmt_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "mgmt_instance_count" {
  type    = string
  default = 1
}

variable "trusted_subnets" {
  type        = list(string)
  description = "List of trusted Kainos IP addresses"
}




