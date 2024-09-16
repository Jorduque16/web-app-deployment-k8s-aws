output "dynamo_table_arn" {
  value = aws_dynamodb_table.tf_state_dynamo_table.arn
}