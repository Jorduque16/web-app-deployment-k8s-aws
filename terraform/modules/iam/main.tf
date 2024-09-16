resource "aws_iam_user" "iam_deployment_user" {
  name = var.deployment_user_name
  path = "/system/"
}

resource "aws_iam_access_key" "iam_deployment_keys" {
  user = aws_iam_user.iam_deployment_user.name
}