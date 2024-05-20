variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "AWS Region"
}

variable "codebuild_project_name" {
  type        = string
  default     = ""
  description = "CodeBuild Project Name"
}

variable "buildspec_tfsec_filepath" {
  type        = string
  default     = ""
  description = "Location of buildspec file to reference for CI run steps for TF sec"
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfsec.yml"
}

variable "buildspec_file_repo_git_url" {
  type        = string
  description = "Repo of Terraform scripts to apply"
  default     = ""
  # example
  # "https://github.com/lloydslistintelligence/lli-terraform.git"
}

variable "service_role_arn" {
  type        = string
  description = "To insert ARN for overriding creation of service role in the module"
  default     = ""
}

variable "webhook_enabled" {
  default     = true
  description = "Allow creation of webhooks for Codebuild and Github, to disable and enable again to retrigger recreation when error occurs"
  type        = bool
}
