module "tfplan" {
  source = "./modules/tfplan"

  count = var.enable_tfplan ? 1 : 0

  codebuild_project_name = var.codebuild_project_name

  # Plan vars
  buildspec_tfplan_filepath = var.buildspec_tfplan_filepath

  service_role_arn            = var.service_role_arn
  buildspec_file_repo_git_url = var.buildspec_file_repo_git_url

  webhook_enabled = var.webhook_enabled

}

module "tfapply" {
  source = "./modules/tfapply"

  count = var.enable_tfapply ? 1 : 0

  codebuild_project_name = var.codebuild_project_name

  # Apply vars
  buildspec_tfapply_filepath = var.buildspec_tfapply_filepath
  github_tf_apply_path       = var.github_tf_apply_path

  service_role_arn            = var.service_role_arn
  buildspec_file_repo_git_url = var.buildspec_file_repo_git_url

  webhook_enabled = var.webhook_enabled

}

module "tfsec_trivy" {
  source = "./modules/tfsec_trivy"

  count = var.enable_tfsec_trivy ? 1 : 0

  codebuild_project_name = var.codebuild_project_name

  # Tfsec trviy vars
  buildspec_tfsec_filepath = var.buildspec_tfsec_filepath

  service_role_arn            = var.service_role_arn
  buildspec_file_repo_git_url = var.buildspec_file_repo_git_url
  region                      = var.region

  webhook_enabled = var.webhook_enabled

}
