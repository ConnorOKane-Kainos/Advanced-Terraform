// Create a DynamoDB table for Terraform state locks with a string hash key of "LockID".
//resource "aws_dynamodb_table" "terraform_locks"

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.project}-${var.name_tag}-terraform-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}