#  null resource is used to run the operations without creating a resource  
 
/* 
 ->  once the resource is created then it cannot be recreated even if changes made in it 

  ->  triggers are used to change the state of infrastructure from current to drift when changes made in that particular resource

->   timestamp()  is the function that provides instant time

->  provisioner   block is  used to execute   commands  either Locally or Remotely  

->  to control the order of creating blocks   we use meta arguments  such as  depend_on

*/




resource "null_resource" "sshnull1" {

  # forces replacement : everytime
  triggers = {
    mytest = timestamp()
  }


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/ESHWAR/Downloads/terraformkey.pem")
    host        = aws_instance.os1.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd --now",
      " sudo touch   kanna.html  ",
     " sudo  bash -c  ' echo  date  >  kanna.html '  " , 
      "sudo cp  kanna.html    /var/www/html/  "
      
    ]
  }

  # meta argument
  depends_on = [
    aws_instance.os1
  ]

}