terraform {
  required_providers {
    aws = {
      source = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.17"
    }
  }
}


provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}