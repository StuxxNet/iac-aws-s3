## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.log_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.log_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.logs_30d_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.nonversioned_30d_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.versioned_30d_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.example](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_ownership_controls.ownership_control](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_versioning.versioning_example](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.statis_website](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket. Must be globally unique. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tag values | `map(string)` | <pre>{<br>  "Environment": "Dev"<br>}</pre> | no |
| <a name="input_enable_30d_lifecycle"></a> [enable\_30d\_lifecycle](#input\_enable\_30d\_lifecycle) | If the bucket should have a 30 day lifecycle rule. | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | If the bucket should have logging enabled. | `bool` | `false` | no |
| <a name="input_enable_static_website"></a> [enable\_static\_website](#input\_enable\_static\_website) | If the bucket should be configured as a static website. | `bool` | `false` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | If the bucket should have versioning enabled. | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If all objects should be deleted from the bucket so that the bucket can be destroyed without error. | `bool` | `false` | no |
| <a name="input_object_lock_enabled"></a> [object\_lock\_enabled](#input\_object\_lock\_enabled) | If the bucket should be locked to prevent objects from being deleted or overwritten. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the S3 bucket. |
