variable "location" {
  description = "Localização de execução da conta"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "Tier da Storage Account na Azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação de dados da Storage Account"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome para o Resource Groupo"
  type        = string
  default     = "rg-curso-terraform"
}

variable "storage_account_name" {
  description = "Nome para o Storage Account"
  type        = string
  default     = "thiagoterraform"
}

variable "container_name" {
  description = "Nome para o Container"
  type        = string
  default     = "container-terraform"
}