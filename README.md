# terraform-aws-codebuild-tf-pipelines

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.12 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfapply"></a> [tfapply](#module\_tfapply) | ./modules/tfapply | n/a |
| <a name="module_tfplan"></a> [tfplan](#module\_tfplan) | ./modules/tfplan | n/a |
| <a name="module_tfsec_trivy"></a> [tfsec\_trivy](#module\_tfsec\_trivy) | ./modules/tfsec_trivy | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buildspec_file_repo_git_url"></a> [buildspec\_file\_repo\_git\_url](#input\_buildspec\_file\_repo\_git\_url) | Repo of Terraform scripts to apply | `string` | `""` | no |
| <a name="input_buildspec_tfapply_filepath"></a> [buildspec\_tfapply\_filepath](#input\_buildspec\_tfapply\_filepath) | Location of buildspec file to reference for CI run steps for TF apply | `string` | `""` | no |
| <a name="input_buildspec_tfplan_filepath"></a> [buildspec\_tfplan\_filepath](#input\_buildspec\_tfplan\_filepath) | Location of buildspec file to reference for CI run steps for TF plan | `string` | `""` | no |
| <a name="input_buildspec_tfsec_filepath"></a> [buildspec\_tfsec\_filepath](#input\_buildspec\_tfsec\_filepath) | Location of buildspec file to reference for CI run steps for TF sec | `string` | `""` | no |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | CodeBuild Project Name | `string` | `""` | no |
| <a name="input_enable_tfapply"></a> [enable\_tfapply](#input\_enable\_tfapply) | Flag to conditional create TF Apply CodeBuild module | `bool` | `true` | no |
| <a name="input_enable_tfplan"></a> [enable\_tfplan](#input\_enable\_tfplan) | Flag to conditional create TF Plan CodeBuild module | `bool` | `true` | no |
| <a name="input_enable_tfsec_trivy"></a> [enable\_tfsec\_trivy](#input\_enable\_tfsec\_trivy) | Flag to conditional create TFSec Trivy CodeBuild module | `bool` | `true` | no |
| <a name="input_github_tf_apply_path"></a> [github\_tf\_apply\_path](#input\_github\_tf\_apply\_path) | Path of Terraform scripts to apply or plan | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-1"` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | To insert ARN for overriding creation of service role in the module | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to codebuild | `map(string)` | <pre>{<br>  "project": "test",<br>  "terraform": "true"<br>}</pre> | no |
| <a name="input_webhook_enabled"></a> [webhook\_enabled](#input\_webhook\_enabled) | Allow creation of webhooks for Codebuild and Github, to disable and enable again to retrigger recreation when error occurs | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
