output "subnet_id" {
  description = "ID da Subnet"
  value       = azurerm_subnet.subnet.id
}

output "security_group" {
  description = "security_group"
  value       = azurerm_network_security_group.security_group.id
}