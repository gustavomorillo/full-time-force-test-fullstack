# Terraform Block
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.45"


    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }

}

# Provider Block
provider "aws" {
  region = var.aws_region
}
