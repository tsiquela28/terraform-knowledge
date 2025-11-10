variable "location" {
  type        = string
  description = "Região da AWS"
  default     = "sa-east-1"
}

variable "sg_id" {
  description = "Id do grupo de segurança"
  type        = string
}