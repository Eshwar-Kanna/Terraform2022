




variable  "x"  {
	
	default = 10

	}

variable  "y" {

	default = 20 
 	}

output  "sum_is" {

value = var.x + var.y

}



output  "diff_is" {

value = var.x  - var.y

}

