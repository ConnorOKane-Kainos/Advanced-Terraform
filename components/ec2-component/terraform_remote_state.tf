data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    region = var.aws_region
    bucket = "kpa23-connor-state-s3-tfstate"
    key    = "state/connor-networking-state.tfstate"

  }
}