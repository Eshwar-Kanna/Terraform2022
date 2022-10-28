#  for loop is used to retrive the elements one after another and use 
#  => is used to transform values as key value pair


variable  "first" {
	default = ["a" , "b" , "c"]
	type =list
}

output "o1" {

description = "this is the output from list"
	# value = [for x  in  var.first :upper(x) ]

	value = { for i in var.first : i => upper(i) }


}