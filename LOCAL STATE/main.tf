terraform {
  required_version = "~> 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }
  backend "s3" {
    bucket = "terraform-remote-state-siquela"
    key    = "aws-bucket-importconfig/terraform-new.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "thiagosiquela"
      managed-by = "terraform"
    }
  }
}