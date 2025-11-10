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
    key    = "provider/terraform.tfstate"
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

provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"

  default_tags {
    tags = {
      owner      = "thiagosiquela"
      managed-by = "terraform"
    }
  }
}

provider "aws" {
  alias  = "eua"
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "thiagosiquela"
      managed-by = "terraform"
    }
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.australia
    aws.provider_2 = aws.eua
  }

  source = "./vpc/"

}