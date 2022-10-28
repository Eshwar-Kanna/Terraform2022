
#  here we specify the type of variable using  type Key
#  map is an approach  of storing output as key  value pair 
 

variable  "stringname"  {

	type = string
	}

output  "string_value" {
	value = var.stringname
	}

variable "numbervalue"  {
	type = number
}

output  "number_value" {
	value = var.numbervalue
	}






variable "list"  {

	default = ["kanna" , "tom" , 4 , 5]
	type = list
}

output  "list_value" {
	value = var.list
	}




variable "bool"  {
	type = bool
}

output  "boolean_value" {
	value = var.bool
	}


variable "map"  {

	default = {
			name = "eric"
			age = 35
			mobile = 567342525
		}
	
	type = map
}

output  "map_value" {
	value = var.map
	}


output  "map_value_mob" {
	value = var.map["mobile"]
	}