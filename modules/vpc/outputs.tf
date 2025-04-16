output "vpc_id" {
  value = aws_vpc.k8s-vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "vpc_cidr" {
  value = aws_vpc.k8s-vpc.cidr_block
}
