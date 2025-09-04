# --- Core Lambda Settings ---
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "example-lambda"
}

variable "handler" {
  description = "Function entrypoint in the code"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.11"
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda can use"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Function execution timeout in seconds"
  type        = number
  default     = 3
}

# --- Deployment Options ---
variable "deploy_via_s3" {
  description = "If true, deploy from S3; if false, package locally"
  type        = bool
  default     = false
}

variable "source_file" {
  description = "Path to local source file for packaging"
  type        = string
  default     = "lambda_function.py"
}

variable "output_path" {
  description = "Path to output the packaged zip file"
  type        = string
  default     = "lambda.zip"
}

variable "s3_bucket" {
  description = "S3 bucket name for deployment package"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 key for deployment package"
  type        = string
  default     = null
}

variable "source_code_hash" {
  description = "Base64-encoded SHA256 hash of the deployment package"
  type        = string
  default     = null
}

# --- Environment & Logging ---
variable "environment_variables" {
  description = "Map of environment variables for the Lambda"
  type        = map(string)
  default     = {}
}

variable "log_retention_days" {
  description = "Number of days to retain logs in CloudWatch"
  type        = number
  default     = 7
}

variable "kms_key_id" {
  description = "KMS key ARN for encrypting logs (optional)"
  type        = string
  default     = null
}

variable "default_tags" {
  type        = map(string)
  default     = {}
  description = "Baseline tags applied across all modules"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to override or extend default_tags"
}

# --- IAM Control ---
variable "create_role" {
  description = "Whether to create an IAM role for the Lambda"
  type        = bool
  default     = true
}

variable "role_arn" {
  description = "Existing IAM role ARN to use (required if create_role = false)"
  type        = string
  default     = null
}

# --- IAM Role Creation (only if create_role = true) ---
variable "role_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = null
}

variable "assumed_by_service" {
  description = "Service principal allowed to assume the role"
  type        = string
  default     = "lambda.amazonaws.com"
}

variable "policy_actions" {
  description = "List of IAM actions to allow in the Lambda's policy"
  type        = list(string)
  default = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
  ]
}

variable "policy_resources" {
  description = "List of resources the IAM policy applies to"
  type        = list(string)
  default     = ["*"]
}
