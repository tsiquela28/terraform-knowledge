variable "location" {
  description = "Região padrão da AWS"
  type        = string
  default     = "sa-east-1"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR da Subnet"
  type        = string
  default     = "10.0.1.0/24"
}