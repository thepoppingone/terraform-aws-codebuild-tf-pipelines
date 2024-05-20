# terraform-aws-codebuild-tf-pipelines

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.12 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.12 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.tf_apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codebuild_project.tf_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codebuild_project.tf_sec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codebuild_webhook.tf_apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_webhook) | resource |
| [aws_codebuild_webhook.tf_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_webhook) | resource |
| [aws_codebuild_webhook.tf_sec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_webhook) | resource |
| [aws_iam_role.tf_apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.tf_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.tf_sec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [github_repository_webhook.tf_apply](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) | resource |
| [github_repository_webhook.tf_plan](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) | resource |
| [github_repository_webhook.tf_sec](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) | resource |
| [aws_iam_policy_document.assume_role_apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_tf_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_tfsec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buildspec_file_repo_git_url"></a> [buildspec\_file\_repo\_git\_url](#input\_buildspec\_file\_repo\_git\_url) | Repo of Terraform scripts to apply | `string` | `""` | no |
| <a name="input_buildspec_tfapply_filepath"></a> [buildspec\_tfapply\_filepath](#input\_buildspec\_tfapply\_filepath) | Location of buildspec file to reference for CI run steps for TF apply | `string` | `""` | no |
| <a name="input_buildspec_tfplan_filepath"></a> [buildspec\_tfplan\_filepath](#input\_buildspec\_tfplan\_filepath) | Location of buildspec file to reference for CI run steps for TF plan | `string` | `""` | no |
| <a name="input_buildspec_tfsec_filepath"></a> [buildspec\_tfsec\_filepath](#input\_buildspec\_tfsec\_filepath) | Location of buildspec file to reference for CI run steps for TF sec | `string` | `""` | no |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | CodeBuild Project Name | `string` | `""` | no |
| <a name="input_github_tf_apply_path"></a> [github\_tf\_apply\_path](#input\_github\_tf\_apply\_path) | Path of Terraform scripts to apply or plan | `string` | `""` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | To insert ARN for overriding creation of service role in the module | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to codebuild | `map(string)` | <pre>{<br>  "project": "test",<br>  "terraform": "true"<br>}</pre> | no |
| <a name="input_webhook_enabled"></a> [webhook\_enabled](#input\_webhook\_enabled) | Allow creation of webhooks for Codebuild and Github, to disable and enable again to retrigger recreation when error occurs | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
