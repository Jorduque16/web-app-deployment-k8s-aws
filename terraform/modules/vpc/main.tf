resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value
  tags = {
    "Name" = "${var.prefix}-${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}