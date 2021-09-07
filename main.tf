terraform {
  required_version = ">= 1.0.5"

  backend "s3" {
    bucket         = "tfstate-979089802435"
    key            = "terraform.state"
    region         = "us-east-2" # South America / São Paulo Region
    profile        = "terraform-ak"
    dynamodb_table = "tflock-tfstate-979089802435" # TF State Locking
    encrypt        = true
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

resource "random_pet" "this" { # Produces random name
  length = 4
}

resource "random_pet" "website" { # Produces random name for website
  length = 4
}

module "bucket" {
  source = "./s3_module"
  name   = random_pet.this.id

  versioning = {
    enabled    = false
    mfa_delete = false
  }
}

module "instance_ec2" {
  source = "./ec2_module"
}

module "website" {
  source = "./s3_module"
  name   = random_pet.website.id
  acl    = "public-read"
  files  = "${path.root}/website"
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${random_pet.website.id}/*"
            ]
        }
    ]
}
EOT
}