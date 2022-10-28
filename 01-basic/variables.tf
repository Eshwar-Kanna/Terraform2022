/*   
variable block is used to provide some value to the key  either from input  or a default value through an argument.reference
*/



variable "AWS_REGION" {
  default = "ap-south-1"
}



variable "amiId" {
  default = "ami-0e6329e222e662a52"
}

variable "osName" {}


variable "instance_type" {
  type = map(any)
  default = {
    dev  = "t2.micro"
    test = "t2.small"
    prod = "t2.large"
  }
}

