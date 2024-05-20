terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.12"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

}
