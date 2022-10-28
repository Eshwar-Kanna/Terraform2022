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

