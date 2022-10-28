
/*  lookup() function  is used to retrieve one particular value   instead using index value  and we can set the value of a key according to workspace we are in 
*/





variable "aws_instance"  {

	type = map
	default = {
		dev = "t2.large" 
		test = "t1.micro"
		prod = "t3.small"
		}
	}

output  "mapping" {
value = var.aws_instance["test"]
		}

output  "lookupvalue"  {
value = lookup(var.aws_instance , "test" )
		}

output "workspace" {
value = terraform.workspace
		}

output "workspace-2" {
value =lookup(var.aws_instance ,  terraform.workspace )
		}