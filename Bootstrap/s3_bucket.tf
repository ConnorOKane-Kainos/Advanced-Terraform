// Create an S3 bucket for Terraform state with default tags and a name tag.

resource "aws_s3_bucket" "terraform_state" {
  bucket = local.bucket_name

  lifecycle {
    prevent_destroy = false
  }


  # Merges two sets of tags:
  # 1. `local.default_tags`: A predefined set of default tags.
  # 2. A new map with a key "Name" set to the value of `local.bucket_name`.
  # The resulting map contains all the default tags plus the "Name" tag for the bucket.

  tags = merge(
    local.default_tags,
    tomap({ "Name" = local.bucket_name })
  )
}