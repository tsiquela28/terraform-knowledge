variable "location" {
  type        = string
  description = "Região da AWS"
  default     = "sa-east-1"
}

variable "enviroment" {
  type        = string
  description = "Nome do ambiente"
  default     = "labs"
}