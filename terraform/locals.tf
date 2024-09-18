resource "random_string" "s3_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-random-suffix = random_string.s3_suffix.id
}

locals {
  project-prefix = "${var.project_abbreviation}-${var.target_environment}"
}