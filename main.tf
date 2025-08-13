module "iam_roles" {
  source             = "../iam/roles"
  role_name          = var.role_name
  assumed_by_service = var.assumed_by_service
  default_tags       = var.default_tags
}

module "iam_policies" {
  source           = "../iam/policies"
  policy_name      = var.policy_name
  policy_actions   = var.policy_actions
  policy_resources = var.policy_resources
  deny_resources   = var.deny_resources
  deny_actions     = var.deny_actions
  enable_deny      = var.enable_deny
  default_tags     = var.default_tags
}

module "cloud_watch" {
  source             = "../cloud_watch"
  log_group_name     = var.log_group_name
  log_stream_name    = var.log_stream_name
  instance_id        = var.instance_id
  metric_filter_name = var.metric_filter_name
  default_tags       = var.default_tags
  kms_key_id         = var.kms_key_id
}

# ✅ Only create the archive if using local deployment
data "archive_file" "lambda" {
  count       = var.deploy_via_s3 ? 0 : 1 # Conditional creation
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_days
  kms_key_id        = var.kms_key_id
}


resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = module.iam_roles.role_arn
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout

  filename         = var.deploy_via_s3 ? null : var.output_path
  s3_bucket        = var.deploy_via_s3 ? var.s3_bucket : null
  s3_key           = var.deploy_via_s3 ? var.s3_key : null
  source_code_hash = var.deploy_via_s3 ? var.source_code_hash : data.archive_file.lambda[0].output_base64sha256

  environment {
    variables = merge(
      var.environment_variables,
      {
        log_group_name     = module.cloud_watch.log_group_name
        log_stream_name    = module.cloud_watch.log_stream_name
        metric_filter_name = module.cloud_watch.metric_filter_name
      }
    )
  }

  tracing_config {
    mode = "Active" # ✅ Enables AWS X-Ray tracing
  }
}
