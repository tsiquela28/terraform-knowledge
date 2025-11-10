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
    key    = "aws-remote-module/terraform.tfstate"
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

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"

  name = "vpc-remote-module"
  cidr = "10.0.0.0/16"

  azs             = ["sa-east-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    env = "teste siquela"
  }
}