# --- IAM Role & Policy (optional) ---
resource "aws_iam_role" "lambda_role" {
  count = var.create_role ? 1 : 0

  name = var.role_name != null ? var.role_name : "${var.function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = var.assumed_by_service
      }
    }]
  })

  tags = merge(var.default_tags, var.tags)
}

resource "aws_iam_policy" "lambda_policy" {
  count = var.create_role && length(var.policy_actions) > 0 ? 1 : 0

  name = "${var.function_name}-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = var.policy_actions
      Resource = var.policy_resources
    }]
  })

  tags = merge(var.default_tags, var.tags)
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  count = var.create_role && length(var.policy_actions) > 0 ? 1 : 0

  role       = aws_iam_role.lambda_role[0].name
  policy_arn = aws_iam_policy.lambda_policy[0].arn
}

# --- Package Lambda code if local ---
data "archive_file" "lambda" {
  count       = var.deploy_via_s3 ? 0 : 1
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

# --- CloudWatch Log Group ---
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_days
  kms_key_id        = var.kms_key_id
  tags              = merge(var.default_tags, var.tags)
}

# --- Lambda Function ---
resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = var.create_role ? aws_iam_role.lambda_role[0].arn : var.role_arn
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout

  filename         = var.deploy_via_s3 ? null : var.output_path
  s3_bucket        = var.deploy_via_s3 ? var.s3_bucket : null
  s3_key           = var.deploy_via_s3 ? var.s3_key : null
  source_code_hash = var.deploy_via_s3 ? var.source_code_hash : data.archive_file.lambda[0].output_base64sha256

  environment {
    variables = var.environment_variables
  }

  tracing_config {
    mode = "Active"
  }

  tags = merge(var.default_tags, var.tags)
}
