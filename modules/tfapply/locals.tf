locals {
  repo_name = regex("([^/]+)\\.git$", var.buildspec_file_repo_git_url)
}
