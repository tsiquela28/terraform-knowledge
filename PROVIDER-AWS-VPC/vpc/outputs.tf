output "vpc_id_default" {
  description = "ID da VPC criada no provider padrão"
  value       = aws_vpc.default.id
}

output "vpc_id_provider_1" {
  description = "ID da VPC criada no Provider 1"
  value       = aws_vpc.provider_1.id
}

output "vpc_id_provider_2" {
  description = "ID da VPC criada no Provider 2"
  value       = aws_vpc.provider_2.id 
}