output "vm_ip" {
  description = "IP da VM criada na AWS"
  value       = aws_instance.instance.public_ip
}

output "security_group_id" {
  description = "ID do security group criado"
  value       = aws_security_group.sgdefault.id
}