/*
 ->  s3 reads  the authentication only from AWSCLI  like default   
 ->   such authentication is called static   
  -> to set static authentication    download AWSCLI   and use cmd   "aws configure" provide access_key          and secret_key

 -> link  to download AWSCLI     https://awscli.amazonaws.com/AWSCLIV2.msi

->  s3 doesnot support state-locking bydefault     to enable state-locking  we use dynamodb table
-> use LockID  as partition key while creating a dynamodb table 
-> the process of locking can be viewed in dynamodbtable by exploring table items
*/





terraform {

  required_version = "~> 1.2"

  backend "s3" {
    bucket = "remotelocking"
    key    = "statelock/my.tfstate"
    region = "ap-south-1"

dynamodb_table = "remotelocktable"

}


  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
