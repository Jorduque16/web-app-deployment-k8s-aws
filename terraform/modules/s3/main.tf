resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.bucket_name
}