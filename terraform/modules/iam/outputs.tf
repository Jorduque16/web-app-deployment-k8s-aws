output "deployment_user_arn" {
  value = aws_iam_user.iam_deployment_user.arn
}

output "deployment_user_access_key" {
  value = aws_iam_access_key.iam_deployment_keys.id
  sensitive = true
}

output "deployment_user_secret_key" {
  value = aws_iam_access_key.iam_deployment_keys.secret
  sensitive = true
}