// Define default tags and construct an S3 bucket name using provided variables.

locals {

  default_tags = {
    Project    = var.project
    Component  = var.component
    Enviroment = var.enviroment
    "Name Tag" = var.name_tag
  }

  bucket_name = "${var.project}-${var.name_tag}-${var.enviroment}-s3-tfstate"

}