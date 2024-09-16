variable "vpc_cidr" {
  description = "CIDR used for VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets with his CIDR block"
  type        = map(string)
  default = {
    "public-bt-subnet" = "10.0.100.0/24"
  }
}

variable "private_subnets" {
  description = "List of subnets with his CIDR block"
  type        = map(string)
  default = {
    "private-lb-subnet" = "10.0.1.0/24"
    "private-eks-subnet" = "10.0.3.0/24"
    "private-db-subnet" = "10.0.5.0/24"
  }
}

variable "suffix" {
  description = "suffix used for vpc resources"
  type = string
}
