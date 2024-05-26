
resource "aws_codebuild_project" "tf_apply" {
  name          = "${var.codebuild_project_name}-tf-apply"
  description   = ""
  build_timeout = 60
  service_role  = var.service_role_arn == "" ? try(aws_iam_role.tf_apply[0].arn, "") : var.service_role_arn

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
    buildspec           = var.buildspec_tfapply_filepath
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

data "aws_iam_policy_document" "assume_role_apply" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "tf_apply" {
  count = var.service_role_arn == "" ? 1 : 0

  name                = "${var.codebuild_project_name}-tf-apply-service-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  assume_role_policy  = data.aws_iam_policy_document.assume_role_apply.json
  path                = "/service-role/"
}

resource "aws_codebuild_webhook" "tf_apply" {
  count = var.webhook_enabled ? 1 : 0

  project_name = aws_codebuild_project.tf_apply.name
  build_type   = "BUILD"

  filter_group {
    filter {
      exclude_matched_pattern = false
      pattern                 = "PUSH"
      type                    = "EVENT"
    }

    filter {
      exclude_matched_pattern = false
      pattern                 = var.github_tf_apply_path
      type                    = "FILE_PATH"
    }


    filter {
      exclude_matched_pattern = false
      pattern                 = "refs/heads/main"
      type                    = "HEAD_REF"
    }
  }
}
