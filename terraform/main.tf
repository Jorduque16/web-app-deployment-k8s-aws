# ------------------------------------------------------------------------------
# Terraform Initial Resources
# ------------------------------------------------------------------------------
module "s3" {
  source = "./modules/s3"
  bucket_name = "${local.project-prefix}-tf-terraform-state-${local.s3-random-suffix}"
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

module "dynamo" {
  source = "./modules/dynamo"
  dynamo_table_name = "${local.project-prefix}-tf-terraform-state"
}

output "dynamodb_table_name" {
  value = module.dynamo.dynamodb_table_name
}

# ------------------------------------------------------------------------------
# CI/CD Resources
# ------------------------------------------------------------------------------
module "iam" {
  source = "./modules/iam"
  deployment_user_name = "${local.project-prefix}-deployment-user"
}

# ------------------------------------------------------------------------------
# Application Resources
# ------------------------------------------------------------------------------

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  prefix = local.project-prefix
}