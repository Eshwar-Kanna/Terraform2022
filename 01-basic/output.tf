/* 
-> output  block is used is to print the required values  in the run time 
*/




output "Public_IP_web_url" {
  value = "http://${aws_instance.os1.public_ip}/kanna.html"
}

output "OS_state" {
  value = aws_instance.os1.instance_state
}


output "OS_AZ_name" {
  value = aws_instance.os1.availability_zone
}
