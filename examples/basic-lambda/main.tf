provider "aws" {
  region = "us-east-1"
}

variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime version"
  type        = string
  default     = "python3.9"
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "memory_size" {
  description = "Lambda memory allocation"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Lambda execution timeout"
  type        = number
  default     = 10
}

variable "environment_variables" {
  description = "Lambda environment variables"
  type        = map(string)
  default = {
    LOG_LEVEL = "info"
    STAGE     = "dev"
  }
}

variable "log_retention_days" {
  description = "CloudWatch log retention period"
  type        = number
  default     = 14
}

variable "default_tags" {
  description = "Global tagging strategy for resources"
  type        = map(string)
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 object key"
  type        = string
  default     = null
}

variable "source_code_hash" {
  description = "Base64-encoded SHA256 hash of the Lambda source code"
  type        = string
  default     = null

}

variable "enable_deny" {
  description = "Enable deny policy"
  type        = bool
}

variable "deny_actions" {
  description = "Actions to deny in IAM policy"
  type        = list(string)
}

variable "role_name" {
  description = "IAM role name for Lambda"
  type        = string
}

variable "policy_resources" {
  description = "Resources affected by IAM policy"
  type        = list(string)
}

variable "policy_actions" {
  description = "Actions allowed by IAM policy"
  type        = list(string)
}

variable "assumed_by_service" {
  description = "Service assuming IAM role"
  type        = string
}

variable "deny_resources" {
  description = "Resources explicitly denied"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of IAM policy"
  type        = string
}

variable "source_file" {
  description = "Path to lambda source file"
  type        = string
}

variable "output_path" {
  description = "Path for lambda zip archive"
  type        = string

}

variable "deploy_via_s3" {
  description = "Flag to determine deployment method (true = S3, false = local)"
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Name of CloudWatch log group"
  type        = string

}

variable "log_stream_name" {
  description = "Name of CloudWatch log stream"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

variable "metric_filter_name" {
  description = "Name of the CloudWatch Log Metric Filter"
  type        = string
}

variable "kms_key_id" {
  description = "ARN of the KMS key used to encrypt the CloudWatch Log Group"
  type        = string

}

module "basic-lambda" {
  source                = "../.."
  function_name         = var.function_name
  runtime               = var.runtime
  handler               = var.handler
  memory_size           = var.memory_size
  timeout               = var.timeout
  environment_variables = var.environment_variables
  log_retention_days    = var.log_retention_days
  default_tags          = var.default_tags
  s3_bucket             = var.s3_bucket
  s3_key                = var.s3_key
  kms_key_id            = var.kms_key_id
  source_code_hash      = var.source_code_hash
  role_name             = var.role_name
  policy_resources      = var.policy_resources
  policy_actions        = var.policy_actions
  assumed_by_service    = var.assumed_by_service
  source_file           = var.source_file
  output_path           = var.output_path
  deploy_via_s3         = var.deploy_via_s3
}

output "lambda_arn" {
  description = "ARN of the created Lambda function"
  value       = aws_lambda_function.lambda.arn
}

output "lambda_name" {
  description = "Name of the created Lambda function"
  value       = aws_lambda_function.lambda.function_name
}


output "log_group_name" {
  value = module.cloudwatch.log_group_name # Uses log group from CloudWatch module
}

output "lambda_role_arn" {
  description = "IAM role assigned to the Lambda function"
  value       = module.iam.role_arn
}

output "lambda_function_url" {
  description = "URL endpoint of the Lambda function"
  value       = aws_lambda_function.lambda.invoke_url
}

output "log_stream_name" {
  value = module.cloudwatch.log_stream_name
}
