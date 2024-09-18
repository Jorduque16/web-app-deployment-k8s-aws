terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "{BUCKET_NAME}"
    key = "terraform.tfstate"
    region = "{REGION}"
    dynamodb_table = "{DYNAMO_TABLE_NAME}"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_default_region
  profile  = var.aws_cli_profile_name
  default_tags {
    tags = {
      IaC = "Terraform"
      Project = var.project_name
    }
  }
}