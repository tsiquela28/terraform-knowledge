terraform {
  required_version = "~> 1.11.0"

  required_providers {
    aws = {
      version = "~> 6.0"
      source  = "hashicorp/aws"
    }

    azurerm = {
      version = "=3.0.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "owner"    = "siquela"
      manager-by = "terraform"
    }
  }
}