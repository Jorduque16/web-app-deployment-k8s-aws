output "bucket_arn" {
  value = aws_s3_bucket.tf_state_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.tf_state_bucket.bucket
}