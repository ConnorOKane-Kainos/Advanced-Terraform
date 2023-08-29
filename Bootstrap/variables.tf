variable "project" {
  type        = string
  description = "Name of the project we bootstrap"
}

variable "aws_region" {
  type        = string
  description = "Name of the region we will bootstrap into"
  default     = "eu-west-1"
}

variable "enviroment" {
  type        = string
  description = "Name of the enviroment for the bootstrapping process"
  default     = "state"
}

variable "component" {
  type        = string
  description = "Name of the component for bootstrapping process"
  default     = "state"
}

variable "aws_account_id" {
  type        = string
  description = "ID of my AWS Account"
}

variable "name_tag" {
  default = "connor"
}