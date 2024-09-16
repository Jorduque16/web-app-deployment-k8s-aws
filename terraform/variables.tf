variable "project_name" {
  description = "The name of the project"
  type = string
}

variable "project_abbreviation" {
  description = "Project abbreviation used to name resources"
  type = string
}

variable "aws_cli_profile_name" {
  description = "Profile name used to get aws credentials"
  type = string
}

variable "aws_default_tags" {
  description = "list of tags used by default"
  type = map(string)
}

variable "aws_default_region" {
  description = "AWS default region used to deploy the current project"
  type = string
}


