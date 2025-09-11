variable "location" {
  description = "Região Azure"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {

  description = "Account tier Azure"
  type        = string
  default     = "Standard"

}

variable "replication_type" {

  description = "Replication Type Azure Storage"
  type        = string
  default     = "LRS"

}