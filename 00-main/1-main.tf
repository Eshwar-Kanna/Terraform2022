terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

variable "AWS_REGION" {
  default = "ap-south-1"
}


provider "aws" {
  region     = var.AWS_REGION
  access_key = "AKIA3PVTPFF2JA7TUVHT"
  secret_key = "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"
}


variable "amiId" {
  default = "ami-0e6329e222e662a52"
}

variable "osName" {}


variable "instance_type" {
  type = map(any)
  default = {
    dev  = "t2.micro"
    test = "t2.small"
    prod = "t2.large"
  }
}



resource "aws_instance" "newos" {
  ami                    = var.amiId
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-003c8a342fd097996"]
  instance_type          = "t2.micro"
  tags = {
    Name = var.osName
  }
}



resource "aws_instance" "os1" {
  ami                    = var.amiId
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-02236b2f09a8a6aee"]
  instance_type          = "t2.micro"
  tags = {
    Name = var.osName
  }
}




resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.newos.availability_zone
  size              = 1

  tags = {
    Name = "mywebvol"
  }
}



resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  force_detach = true
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.myvol.id
  instance_id  = aws_instance.newos.id
}





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


resource "null_resource" "localinventorynull" {

        triggers = {
                mytest = timestamp()
        }


        provisioner "local-exec" {
            command = "echo ${aws_instance.os1.public_ip} > local.html"
          }

        depends_on = [
                        aws_instance.os1
                        ]

}




output "Public_IP_web_url" {
  value = "http://${aws_instance.os1.public_ip}/kanna.html"
}

output "OS_state" {
  value = aws_instance.os1.instance_state
}


output "OS_AZ_name" {
  value = aws_instance.os1.availability_zone
}



