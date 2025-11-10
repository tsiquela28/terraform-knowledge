variable "location" {
  description = "Região padrão da AWS"
  type        = string
  default     = "sa-east-1"
}

variable "cidr_vpc" {
  description = "CIDR da VPC"
  type        = string
}

variable "cidr_subnet" {
  description = "CIDR da Subnet"
  type        = string
}

variable "enviroment" {
  description = "Nome do ambiente"
  type        = string
}