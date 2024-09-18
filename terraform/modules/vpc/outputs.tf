output "private_subnet_ids" {
  value = { for key, subnet in aws_subnet.private_subnet : key => subnet.id }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}