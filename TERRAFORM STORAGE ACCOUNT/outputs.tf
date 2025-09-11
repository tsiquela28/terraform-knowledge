output "storage_account_id" {
  description = "Retorna ID da Storage Account"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_primary_key" {
  description = "Retorna a chave do Storage Account"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}