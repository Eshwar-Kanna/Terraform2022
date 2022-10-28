# Provider block is used   define the attributes  or details of  Provider   ex:  aws , azure  ...
# access_key   and  secret_key    used  from   IAM  of  AWS  
/* 
we cannot use multiple providers and cannot use multiple regions in single provider to have such 	usecase we use alias name for every provider and can define multiple providers with 	different regions and authentication 

*/


provider "aws" {
alias = "mumbai"
  region     = "ap-south-1"
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}

provider "aws" {
alias = "usa"
  region     = "us-east-1"
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}