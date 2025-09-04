handler               = "lambda_fuction.handler"
runtime               = "python3.12"
deploy_via_s3         = false
memory_size           = 128
timeout               = 5
environment_variables = { TEST = "true" }
create_role           = true
log_retention_days    = 1
default_tags          = { Purpose = "Terratest" }
