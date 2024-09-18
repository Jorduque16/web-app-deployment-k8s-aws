output "dynamodb_table_arn" {
  value = aws_dynamodb_table.tf_state_dynamo_table.arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.tf_state_dynamo_table.name
}