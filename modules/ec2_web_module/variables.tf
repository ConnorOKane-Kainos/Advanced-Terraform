variable "region" {
    type = string
    description = "The deployment region for this module"
}

variable "project" {
  type = string
  description = "The name of the project in this module"
}
 variable "environment" {
   type = string
   description = "The enviroment of this module"
}

# variable "vpc_id" {
#     type = string
#     description = "VPC ID"
# }


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
}

variable "subnet_id" {
  type = list(string)
}
