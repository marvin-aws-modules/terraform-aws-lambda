

module "basic-lambda" {
  source = "../../.."
  policy_resources = var.policy_resources
  application = var.application
  log_stream_name = var.log_stream_name
  source_code_hash = var.source_code_hash
  memory_size = var.memory_size
  deny_actions = var.deny_actions
  policy_name = var.policy_name
  handler = var.handler
  source_file = var.source_file
  assumed_by_service = var.assumed_by_service
  s3_bucket = var.s3_bucket
  metric_filter_name = var.metric_filter_name
  policy_actions = var.policy_actions
  kms_key_id = var.kms_key_id
  environment_variables = var.environment_variables
  output_path = var.output_path
  deploy_via_s3 = var.deploy_via_s3
  filename = var.filename
  function_name = var.function_name
  s3_key = var.s3_key
  enable_deny = var.enable_deny
  log_retention_days = var.log_retention_days
  runtime = var.runtime
  timeout = var.timeout
  log_group_name = var.log_group_name
  deny_resources = var.deny_resources
  role_name = var.role_name
  default_tags = var.default_tags
  instance_id = var.instance_id
}
