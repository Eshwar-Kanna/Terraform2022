# Provider block is used   define the attributes  or details of  Provider   ex:  aws , azure  ...
# access_key   and  secret_key    used  from   IAM  of  AWS  



provider "aws" {
  region     = var.AWS_REGION
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}