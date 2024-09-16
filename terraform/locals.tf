locals {
  suffix = "${var.project_abbreviation}-${var.aws_default_region}"
}

resource "random_string" "s3_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-random-suffix = random_string.s3_suffix.id
}