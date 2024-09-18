resource "aws_dynamodb_table" "tf_state_dynamo_table" {
  hash_key = "LockID"
  name     = var.dynamo_table_name
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    prevent_destroy = false
  }
}