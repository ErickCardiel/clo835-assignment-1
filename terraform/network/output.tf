output "vpc_id" {
  value = data.aws_vpc.default.id
}


output "public_subnet_id" {
  value = data.aws_subnet.public.id
}