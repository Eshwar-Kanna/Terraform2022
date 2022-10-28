
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


