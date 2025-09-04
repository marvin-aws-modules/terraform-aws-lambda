output "lambda_arn" {
  description = "ARN of the created Lambda function"
  value       = module.basic_lambda.lambda_arn
}

output "lambda_name" {
  description = "Name of the created Lambda function"
  value       = module.basic_lambda.lambda_name
}

# output "log_group_name" {
#   description = "Name of the CloudWatch log group for the Lambda"
#   value       = module.basic_lambda.log_group_name
# }

# output "lambda_role_arn" {
#   description = "IAM role assigned to the Lambda function"
#   value       = var.create_role ? aws_iam_role.lambda_role[0].arn : var.role_arn
# }

# Only include this if you actually create a Lambda Function URL
# resource "aws_lambda_function_url" "lambda_url" { ... }
# Then:
# output "lambda_function_url" {
#   description = "URL endpoint of the Lambda function"
#   value       = aws_lambda_function_url.lambda_url.function_url
# }
