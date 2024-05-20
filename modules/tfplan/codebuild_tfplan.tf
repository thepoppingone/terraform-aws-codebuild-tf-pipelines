
resource "aws_codebuild_project" "tf_plan" {
  name          = "${var.codebuild_project_name}-tf-plan"
  description   = ""
  build_timeout = 60
  service_role  = var.service_role_arn == "" ? try(aws_iam_role.tf_plan[0].arn, "") : var.service_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_SOURCE_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    # environment_variable {
    #   name  = "SOME_KEY1"
    #   value = "SOME_VALUE1"
    # }

    # environment_variable {
    #   name  = "SOME_KEY2"
    #   value = "SOME_VALUE2"
    #   type  = "PARAMETER_STORE"
    # }
  }

  logs_config {
    # cloudwatch_logs {
    #   group_name  = "log-group"
    #   stream_name = "log-stream"
    # }

    # s3_logs {
    #   status   = "ENABLED"
    #   location = "${aws_s3_bucket.example.id}/build-log"
    # }
  }

  source {
    type                = "GITHUB"
    location            = var.buildspec_file_repo_git_url
    git_clone_depth     = 1
    buildspec           = var.buildspec_tfplan_filepath
    report_build_status = true

    git_submodules_config {
      fetch_submodules = true
    }
  }

  # Not needed unless need internal traffic
  # vpc_config {
  #   vpc_id = data.aws_ssm_parameter.dev_vpc_id.value

  #   subnets = tolist(split(",", data.aws_ssm_parameter.dev_private_subnet_ids.value))

  #   security_group_ids = [
  #     aws_security_group.example1.id,
  #     aws_security_group.example2.id,
  #   ]
  # }

}

data "aws_iam_policy_document" "assume_role_tf_plan" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "tf_plan" {
  count               = var.service_role_arn == "" ? 1 : 0
  name                = "${var.codebuild_project_name}-tf-plan-service-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess", "arn:aws:iam::aws:policy/IAMReadOnlyAccess"]
  assume_role_policy  = data.aws_iam_policy_document.assume_role_tf_plan.json
  path                = "/service-role/"
}

resource "aws_codebuild_webhook" "tf_plan" {
  count = var.webhook_enabled ? 1 : 0

  project_name = aws_codebuild_project.tf_plan.name
  build_type   = "BUILD"

  filter_group {
    filter {
      exclude_matched_pattern = false
      pattern                 = "PULL_REQUEST_CREATED,PULL_REQUEST_UPDATED,PULL_REQUEST_REOPENED"
      type                    = "EVENT"
    }
  }
}

resource "github_repository_webhook" "tf_plan" {
  count = var.webhook_enabled ? 1 : 0

  active     = true
  events     = ["pull_request"]
  repository = local.repo_name[0]

  configuration {
    url          = aws_codebuild_webhook.tf_plan[0].payload_url
    secret       = aws_codebuild_webhook.tf_plan[0].secret
    content_type = "json"
    insecure_ssl = false
  }
}
