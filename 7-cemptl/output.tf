
output "Public_IP_web_url" {
  value = "http://${aws_instance.os1[1].public_ip}/kanna.html"
}

output "OS_state" {
  value = aws_instance.os1[2].instance_state
}


output "OS_AZ_name" {
  value = aws_instance.os1[2].availability_zone
}

