variable "vpc_cidr" {
  description = "CIDR used for VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of subnets with his CIDR block"
  type        = map(string)
  default = {
    "private-bt-subnet" = "10.0.100.0/24"
    "private-lb-subnet" = "10.0.1.0/24"
    "private-eks-subnet" = "10.0.3.0/24"
    "private-db-subnet" = "10.0.5.0/24"
  }
}

variable "prefix" {
  description = "prefix used for vpc resources"
  type = string
}
