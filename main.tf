terraform {
  required_version = ">= 1.0.5"

  backend "s3" {
    bucket  = "tfstate-979089802435"
    key     = "production/terraform.state"
    region  = "us-east-2" # South America / São Paulo Region
    profile = "terraform-ak"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "terraform-ak"
}