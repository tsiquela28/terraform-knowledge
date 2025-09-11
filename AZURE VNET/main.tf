terraform {
  required_version = "~> 1.12.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }

  backend "azurerm" {
    use_oidc             = true
    resource_group_name  = "terraform-remote-state"
    storage_account_name = "terraformstatesiquela"
    container_name       = "terraform-remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }

}


provider "azurerm" {
  features {}
}