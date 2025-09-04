function_name = "basic-lambda-function"

runtime     = "python3.9"
handler     = "lambda_function.lambda_handler"
memory_size = 128
timeout     = 10

environment_variables = {
  LOG_LEVEL = "info"
  STAGE     = "dev"
}

log_retention_days = 14

default_tags = {
  Environment = "dev"
  Project     = "basic-lambda"
  Owner       = "marvin"
}

s3_bucket        = "lambda-deployment-bucket"
s3_key           = "functions/basic-lambda.zip"
source_code_hash = "base64-encoded-sha256-hash"

enable_deny = true

deny_actions = [
  "s3:DeleteObject"
]

role_name = "basic-lambda-role"

policy_resources = [
  "*"
]

policy_actions = [
  "logs:CreateLogGroup",
  "logs:CreateLogStream",
  "logs:PutLogEvents"
]

assumed_by_service = "lambda.amazonaws.com"

deny_resources = [
  "arn:aws:s3:::sensitive-data/*"
]

policy_name = "basic-lambda-policy"

source_file   = "src/lambda_function.py"
output_path   = "dist/basic-lambda.zip"
deploy_via_s3 = true

log_group_name  = "/aws/lambda/basic-lambda-function"
log_stream_name = "basic-lambda-stream"

instance_id = "i-0abc1234def567890"

metric_filter_name = "basic-lambda-metric-filter"

kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-5678-90ef-ghij-klmnopqrstuv"
