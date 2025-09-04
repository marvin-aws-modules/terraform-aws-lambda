<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | ~> 2.3.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assumed_by_service"></a> [assumed\_by\_service](#input\_assumed\_by\_service) | Service principal allowed to assume the role | `string` | `"lambda.amazonaws.com"` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create an IAM role for the Lambda | `bool` | `true` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Baseline tags applied across all modules | `map(string)` | `{}` | no |
| <a name="input_deploy_via_s3"></a> [deploy\_via\_s3](#input\_deploy\_via\_s3) | If true, deploy from S3; if false, package locally | `bool` | `false` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Map of environment variables for the Lambda | `map(string)` | `{}` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the Lambda function | `string` | `"example-lambda"` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | Function entrypoint in the code | `string` | `"index.handler"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key ARN for encrypting logs (optional) | `string` | `null` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Number of days to retain logs in CloudWatch | `number` | `7` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Amount of memory in MB your Lambda can use | `number` | `128` | no |
| <a name="input_output_path"></a> [output\_path](#input\_output\_path) | Path to output the packaged zip file | `string` | `"lambda.zip"` | no |
| <a name="input_policy_actions"></a> [policy\_actions](#input\_policy\_actions) | List of IAM actions to allow in the Lambda's policy | `list(string)` | <pre>[<br/>  "logs:CreateLogGroup",<br/>  "logs:CreateLogStream",<br/>  "logs:PutLogEvents"<br/>]</pre> | no |
| <a name="input_policy_resources"></a> [policy\_resources](#input\_policy\_resources) | List of resources the IAM policy applies to | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Existing IAM role ARN to use (required if create\_role = false) | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the IAM role to create | `string` | `null` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Lambda runtime environment | `string` | `"python3.11"` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | S3 bucket name for deployment package | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | S3 key for deployment package | `string` | `null` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | Base64-encoded SHA256 hash of the deployment package | `string` | `null` | no |
| <a name="input_source_file"></a> [source\_file](#input\_source\_file) | Path to local source file for packaging | `string` | `"lambda_function.py"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to override or extend default\_tags | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Function execution timeout in seconds | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | ARN of the created Lambda function |
| <a name="output_lambda_name"></a> [lambda\_name](#output\_lambda\_name) | Name of the created Lambda function |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | IAM role assigned to the Lambda function |
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | Name of the CloudWatch log group for the Lambda |
<!-- END_TF_DOCS -->
