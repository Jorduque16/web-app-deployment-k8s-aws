resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.bucket_name
  provisioner "local-exec" {
    when    = destroy
    command = "aws s3 rm s3://${self.bucket} --recursive"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_configuration_key" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  lifecycle {
    prevent_destroy = false
  }
}