/*   
->  element function is used to retrieve the element from the list mentioned according to the index 	number
->  splat operation (*) is used to perform similar operation such as for and count.index
-> instead of using sensitive data directly in the code we use Vault as centrolized storage
-> we use time-sleep resource to set some pause in between the resource to create while creating the 
	infrastructure
->  zipmap is used to set two values as key value pairs  
-> we cannot use multiple providers and cannot use multiple regions in single provider to have such 	usecase we use alias name for every provider and can define multiple providers with 	different regions and authentication 

*/

variable  "subnet-cidr" {
default = ["10.0.1.0/24" , "10.0.2.0/24","10.0.3.0/24"]
}


variable "azs"{
default = ["ap-south-1a", "ap-south-1b" , "ap-south-1c"]
}


resource "aws_vpc" "main" { 
cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}



resource "aws_subnet"  "main-sub" {
count = length(var.subnet-cidr) 
vpc_id = aws_vpc.main.id
map_public_ip_on_launch = true
availability_zone = element(var.azs , count.index)
cidr_block = element(var.subnet-cidr , count.index)

tags ={
Name = "terraform-subnet-${count.index + 1}"
}
}


output "subnets" {
value = [element(aws_subnet.main-sub.*.id , 0 ) ,element(aws_subnet.main-sub.*.id , 1),element(aws_subnet.main-sub.*.id , 2 )]
}

output "zipmap" {

value = zipmap(aws_subnet.main-sub[*] .id , aws_subnet.main-sub[*].availability_zone)
}

