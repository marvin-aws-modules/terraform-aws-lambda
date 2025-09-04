data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda.zip"
}

resource "random_id" "suffix" {
  byte_length = 4
}


module "basic_lambda" {
  source = "../../.."

  function_name         = "lambda-test-${random_id.suffix.hex}"
  handler               = var.handler
  runtime               = var.runtime
  source_file           = var.source_file
  deploy_via_s3         = var.deploy_via_s3
  memory_size           = var.memory_size
  timeout               = var.timeout
  environment_variables = var.environment_variables
  create_role           = var.create_role
  log_retention_days    = var.log_retention_days
  default_tags          = var.default_tags
}

