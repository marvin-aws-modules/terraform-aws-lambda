variable "policy_resources" {
  type        = list(string)
  description = "Policy resources for testing"
}
variable "application" {
  type        = string
  description = "Application for testing"
}
variable "log_stream_name" {
  type        = string
  description = "Log stream name for testing"
}
variable "source_code_hash" {
  type        = string
  description = "Source code hash for testing"
}
variable "memory_size" {
  type        = number
  description = "Memory size for testing"
}
variable "deny_actions" {
  type        = list(string)
  description = "Deny actions for testing"
}
variable "policy_name" {
  type        = string
  description = "Policy name for testing"
}
variable "handler" {
  type        = string
  description = "Handler for testing"
}
variable "source_file" {
  type        = string
  description = "Source file for testing"
}
variable "assumed_by_service" {
  type        = string
  description = "Assumed by service for testing"
}
variable "s3_bucket" {
  type        = string
  description = "S3 bucket for testing"
}
variable "metric_filter_name" {
  type        = string
  description = "Metric filter name for testing"
}
variable "policy_actions" {
  type        = list(string)
  description = "Policy actions for testing"
}
variable "kms_key_id" {
  type        = string
  description = "Kms key id for testing"
}
variable "environment_variables" {
  type        = map(string)
  description = "Environment variables for testing"
}
variable "output_path" {
  type        = string
  description = "Output path for testing"
}
variable "deploy_via_s3" {
  type        = bool
  description = "Deploy via s3 for testing"
}
variable "filename" {
  type        = any
  description = "Filename for testing"
}
variable "function_name" {
  type        = string
  description = "Function name for testing"
}
variable "s3_key" {
  type        = string
  description = "S3 key for testing"
}
variable "enable_deny" {
  type        = bool
  description = "Enable deny for testing"
}
variable "log_retention_days" {
  type        = number
  description = "Log retention days for testing"
}
variable "runtime" {
  type        = string
  description = "Runtime for testing"
}
variable "timeout" {
  type        = number
  description = "Timeout for testing"
}
variable "log_group_name" {
  type        = string
  description = "Log group name for testing"
}
variable "deny_resources" {
  type        = list(string)
  description = "Deny resources for testing"
}
variable "role_name" {
  type        = string
  description = "Role name for testing"
}
variable "default_tags" {
  type        = map(string)
  description = "Default tags for testing"
}
variable "instance_id" {
  type        = string
  description = "Instance id for testing"
}

