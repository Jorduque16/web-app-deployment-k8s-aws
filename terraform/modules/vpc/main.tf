resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "vpc-${var.suffix}"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${each.key}-${var.suffix}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value
  tags = {
    "Name" = "${each.key}-${var.suffix}"
  }
  depends_on = [
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw-vpc-${var.suffix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-crt-${var.suffix}"
  }
}

resource "aws_route_table_association" "public_subnet_rta" {
  for_each = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_crt.id
}