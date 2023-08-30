variable "region" {
  type        = string
  description = "The deployment region for this module"
  default     = "eu-west-1"
}

variable "project" {
  type        = string
  description = "The name of the project in this module"
}
variable "environment" {
  type        = string
  description = "The enviroment of this module"
}


variable "instance_count" {
  type = string
}

variable "instance_ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "user_data_file" {
  type = string
  description = "User data for the EC2 instance"
}

variable "subnet_id" {
  type = list(string)
  description = "List of all the subnet ids"
}

variable "instance_role" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "value"
}

variable "sg_inbound_port" {
  type        = number
  description = "List of private subnets."
  default     = 80
}

variable "public_ip_enabled" {
  type        = bool
  description = "Flag to enable/disable public ip"
  default     = false
}

variable "ec2_sg_ingress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "ec2_sg_egress_rules" {
  type = list(object({
    type        = string
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
  default = []
}

