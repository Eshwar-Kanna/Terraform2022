
#  terraform block is used to declare the  provider  using to create the infrastructure like AWS , AZURE




terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}