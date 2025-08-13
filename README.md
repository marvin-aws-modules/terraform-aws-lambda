<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.12.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_watch"></a> [cloud\_watch](#module\_cloud\_watch) | ../cloud_watch | n/a |
| <a name="module_iam_policies"></a> [iam\_policies](#module\_iam\_policies) | ../iam/policies | n/a |
| <a name="module_iam_roles"></a> [iam\_roles](#module\_iam\_roles) | ../iam/roles | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.test_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application | `string` | n/a | yes |
| <a name="input_assumed_by_service"></a> [assumed\_by\_service](#input\_assumed\_by\_service) | Service assuming IAM role | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Global tagging strategy for resources | `map(string)` | n/a | yes |
| <a name="input_deny_actions"></a> [deny\_actions](#input\_deny\_actions) | Actions to deny in IAM policy | `list(string)` | n/a | yes |
| <a name="input_deny_resources"></a> [deny\_resources](#input\_deny\_resources) | Resources explicitly denied | `list(string)` | n/a | yes |
| <a name="input_deploy_via_s3"></a> [deploy\_via\_s3](#input\_deploy\_via\_s3) | Flag to determine deployment method (true = S3, false = local) | `bool` | `false` | no |
| <a name="input_enable_deny"></a> [enable\_deny](#input\_enable\_deny) | Enable deny policy | `bool` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Lambda environment variables | `map(string)` | <pre>{<br/>  "LOG_LEVEL": "info",<br/>  "STAGE": "dev"<br/>}</pre> | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Path to the local ZIP file | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Lambda function name | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Lambda function handler | `string` | `"lambda_function.lambda_handler"` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | EC2 instance ID | `string` | n/a | yes |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Name of CloudWatch log group | `string` | n/a | yes |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | CloudWatch log retention period | `number` | `14` | no |
| <a name="input_log_stream_name"></a> [log\_stream\_name](#input\_log\_stream\_name) | Name of CloudWatch log stream | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Lambda memory allocation | `number` | `128` | no |
| <a name="input_metric_filter_name"></a> [metric\_filter\_name](#input\_metric\_filter\_name) | Name of the CloudWatch Log Metric Filter | `string` | n/a | yes |
| <a name="input_output_path"></a> [output\_path](#input\_output\_path) | Path for lambda zip archive | `string` | n/a | yes |
| <a name="input_policy_actions"></a> [policy\_actions](#input\_policy\_actions) | Actions allowed by IAM policy | `list(string)` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of IAM policy | `string` | n/a | yes |
| <a name="input_policy_resources"></a> [policy\_resources](#input\_policy\_resources) | Resources affected by IAM policy | `list(string)` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role name for Lambda | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Lambda runtime version | `string` | `"python3.9"` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | S3 bucket name | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | S3 object key | `string` | `null` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | Base64-encoded SHA256 hash of the Lambda source code | `string` | `null` | no |
| <a name="input_source_file"></a> [source\_file](#input\_source\_file) | Path to lambda source file | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Lambda execution timeout | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | ARN of the created Lambda function |
| <a name="output_lambda_function_url"></a> [lambda\_function\_url](#output\_lambda\_function\_url) | URL endpoint of the Lambda function |
| <a name="output_lambda_name"></a> [lambda\_name](#output\_lambda\_name) | Name of the created Lambda function |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | IAM role assigned to the Lambda function |
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | n/a |
| <a name="output_log_stream_name"></a> [log\_stream\_name](#output\_log\_stream\_name) | n/a |
<!-- END_TF_DOCS -->
