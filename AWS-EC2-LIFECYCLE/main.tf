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
    key    = "lifecycle-aws-ec2/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = var.location

  default_tags {
    tags = {
      owner      = "thiagosiquela"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-remote-state-siquela"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}