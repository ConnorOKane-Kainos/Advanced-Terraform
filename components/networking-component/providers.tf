terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "kpa23-connor-state-s3-tfstate"
    key            = "state/connor-networking-state.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "kpa23-connor-terraform-running-locks"
  }
}

provider "aws" {
  region = var.aws_region
}