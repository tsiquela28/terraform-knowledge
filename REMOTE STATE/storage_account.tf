resource "azurerm_resource_group" "resource_group" {
  name     = "terraform-remote-state"
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "terraformstatesiquela"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  blob_properties {
    versioning_enabled = true
  }

  tags = local.tags
}

resource "azurerm_storage_container" "scontainer" {
  name                  = "terraform-remote-state"
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}