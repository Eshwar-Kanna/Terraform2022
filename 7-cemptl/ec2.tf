/*
 ->  to launch multiple  similar instance  we use count  and here the osname becomes list adn each os is stored as elements in list with same name 
-> max()  is used to find the maximum value from the elements
-> max() cannot be used in resources we can use them in locals 

*/




resource "aws_instance" "newos" {
  ami                    = var.amiId
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-003c8a342fd097996"]
  instance_type          = "t2.micro"
  tags = {
    Name = "os-${max(2,8,4,3)}"
  }
}



resource "aws_instance" "os1" {
  ami                    = var.amiId
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-02236b2f09a8a6aee"]
  instance_type          = "t2.micro"
count = 3
  tags = {
    Name = "os -${var.v1[count.index]}"
  }
}

variable "v1" {
default = ["a" , "b" , "c" , "d" ]

}


variable "x" {
type = bool 
}

output "max" {
value = max(3,6,3,5,1)
}

output "o1" {

value = var.x==true ?  "its true " : "its false"
}



locals {

max_number = max(5,7,2,3,4)
state = "telangana"
country = "india"
}

output "local" {
value = tomap({"${local.max_number}" = "${local.country}"})
}