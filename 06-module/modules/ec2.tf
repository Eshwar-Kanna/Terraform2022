
data  "aws_ami" "imageid" {
	most_recent = true

	owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}





resource "aws_instance" "newos" {
  ami                    = data.aws_ami.imageid.id
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-003c8a342fd097996"]
  instance_type          = "t2.micro"
  tags = {
    Name = var.osName
  }
}

output "o4"  {

value = data.aws_ami.imageid.creation_date

}
