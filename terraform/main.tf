module "iam" {
  source = "./modules/iam"
  deployment_user_name = "deployment-user-${local.suffix}"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "tf-terraform-state-${local.s3-random-suffix}"
}

module "dynamo" {
  source = "./modules/dynamo"
  dynamo_table_name = "tf-terraform-state"
}

module "vpc" {
  source = "./modules/vpc"
  suffix   = var.project_abbreviation
  vpc_cidr = "10.0.0.0/16"
}