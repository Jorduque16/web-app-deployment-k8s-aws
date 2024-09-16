terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_default_region
  profile  = var.aws_cli_profile_name
  default_tags {
    tags = {
      Environment = "Dev"
      IaC = "Terraform"
      Project = var.project_name
    }
  }
}