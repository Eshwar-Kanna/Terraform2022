/* 
when their is a requirement of performing similar operation multiple times it is not better practise to write the same code multiple times for such cases we write the code in one particular file and use it as a module by providing its path as source
*/



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

variable "AWS_REGION" {
  default = "ap-south-1"
}


provider "aws" {
  region     = var.AWS_REGION
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}



module "aws_instance"    {

source = "../6-module/modules/"
}


output "o2" {
	value = "output from main file"
}

output "o3" {
value = module.aws_instance.o1
}

output "o4" {
value = module.aws_instance.o4
}