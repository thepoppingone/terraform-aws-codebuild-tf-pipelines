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

# File Paths

variable "github_tf_apply_path" {
  type        = string
  default     = ""
  description = "Path of Terraform scripts to apply or plan"
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/*"
}

variable "buildspec_tfsec_filepath" {
  type        = string
  default     = ""
  description = "Location of buildspec file to reference for CI run steps for TF sec"
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfsec.yml"
}

variable "buildspec_tfplan_filepath" {
  type        = string
  default     = ""
  description = "Location of buildspec file to reference for CI run steps for TF plan"
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfplan.yml"
}

variable "buildspec_tfapply_filepath" {
  type        = string
  default     = ""
  description = "Location of buildspec file to reference for CI run steps for TF apply"
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfapply.yml"
}

variable "buildspec_file_repo_git_url" {
  type        = string
  description = "Repo of Terraform scripts to apply"
  default     = ""
  # example
  # "https://github.com/lloydslistintelligence/lli-terraform.git"
}

# AWS Resources

variable "service_role_arn" {
  type        = string
  description = "To insert ARN for overriding creation of service role in the module"
  default     = ""
}

# GitHub Webhook enablement flags

variable "webhook_enabled" {
  default     = true
  description = "Allow creation of webhooks for Codebuild and Github, to disable and enable again to retrigger recreation when error occurs"
  type        = bool
}

# Module Creation Flags

variable "enable_tfplan" {
  default     = true
  description = "Flag to conditional create TF Plan CodeBuild module"
  type        = bool
}

variable "enable_tfapply" {
  default     = true
  description = "Flag to conditional create TF Apply CodeBuild module"
  type        = bool
}

variable "enable_tfsec_trivy" {
  default     = true
  description = "Flag to conditional create TFSec Trivy CodeBuild module"
  type        = bool
}


variable "tags" {
  type = map(string)
  default = {
    "terraform" = "true"
    "project"   = "test"
  }
  description = "Tags to add to codebuild"
}
