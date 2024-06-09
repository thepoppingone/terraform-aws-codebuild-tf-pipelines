# module "awsacc_env_codebuild" {
#   source = "github.com/<user_or_org>/terraform-aws-codebuild-tf-pipelines"

#   codebuild_project_name = "test-infra"
#   github_tf_apply_path   = "envs/dev/*"

#   buildspec_file_repo_git_url = "https://github.com/<user_or_org>/test-infra.git"
#   buildspec_tfapply_filepath  = "envs/uat/buildspec-tfapply.yml"
#   buildspec_tfplan_filepath   = "envs/uat/buildspec-tfplan.yml"

#   tags = {
#     "Platform"    = ""
#     "Environment" = ""
#   }
# }
