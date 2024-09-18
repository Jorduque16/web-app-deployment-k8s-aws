#!/bin/bash

# ------------------------------------------------------------------------------
# Local Terraform Deployment
# ------------------------------------------------------------------------------
cd ../terraform/

# Execute terraform init
terraform init

# Check if terraform init was successfully
if [ $? -ne 0 ]; then
  echo "terraform init failed. Finishing."
  exit 1
fi

# Execute terraform apply
terraform apply -auto-approve -var-file="dev.tfvars"

# Check if terraform apply was successfully
if [ $? -ne 0 ]; then
  echo "terraform apply failed. Finishing."
  exit 1
fi

# ------------------------------------------------------------------------------
# Terraform State Migration
# ------------------------------------------------------------------------------

# Get resource outputs to configure the terraform backend
REGION=$(grep 'aws_default_region' dev.tfvars | sed 's/.*= \"\(.*\)\"/\1/')
DYNAMODB_TABLE_NAME=$(terraform output -raw dynamodb_table_name)
S3_BUCKET_NAME=$(terraform output -raw s3_bucket_name)

# Replace local backend to remote backend configuration
cp ../scripts/templates/remote_backend.tf .providers.tf

# Replace {BUCKET_NAME} por $S3_BUCKET_NAME
sed -i "s/{BUCKET_NAME}/$S3_BUCKET_NAME/g" providers.tf

# Replace {REGION} por $REGION
sed -i "s/{REGION}/$REGION/g" providers.tf

# Replace {DYNAMO_TABLE_NAME} por $DYNAMODB_TABLE_NAME
sed -i "s/{DYNAMO_TABLE_NAME}/$DYNAMODB_TABLE_NAME/g" providers.tf

# Execute terraform init with backend resources configured
terraform init -migrate-state


