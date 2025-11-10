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
    key    = "aws-ec2-local-module/terraform.tfstate"
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

module "network" {
  source      = "./network/"
  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.0.0/24"
  enviroment  = "labs"
}
