
/* 
->  we make the resource dynamic  such that we can use the block multiple times with a change in value of particular keys 

->  for_each is used to apply for loop   and iterator  to specify number of times 
-> we use the key  as contents and provide all specifications as its value 

*/




resource "aws_security_group" "allow_tls" {
  name        = "allow_tlsandssh"
  description = "Allow TLS inbound traffic"
  vpc_id      =  "vpc-06f405c2a337e0f4f"

 dynamic  "ingress" {
    
for_each  = var.sgports
iterator = portnumber
 content { 
    	description      = "TLS from VPC"
    	from_port        = portnumber.value
    	to_port          = portnumber.value
    	protocol         = "tcp"
    	cidr_blocks      = ["0.0.0.0/0"]
   	# ipv6_cidr_blocks = ["::/0"]
                 }
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}