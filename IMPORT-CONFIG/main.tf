terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      version = "~> 6.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      "owner"    = "siquela"
      manager-by = "terraform"
    }
  }
}