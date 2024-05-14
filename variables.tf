variable "codebuild_project_name" {
  type    = string
  default = ""
}

variable "github_tf_apply_path" {
  type    = string
  default = ""
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/*"
}

variable "buildspec_tfplan_filepath" {
  type    = string
  default = ""
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfplan.yml"
}

variable "buildspec_tfapply_filepath" {
  type    = string
  default = ""
  # example
  # "aws_accounts/seasearcher_non_prod/envs/dev/api/buildspec-tfapply.yml"
}

variable "buildspec_file_repo_git_url" {
  type    = string
  default = ""
  # example
  # "https://github.com/lloydslistintelligence/lli-terraform.git"
}

variable "service_role_arn" {
  type    = string
  default = ""
}
