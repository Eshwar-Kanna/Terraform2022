/*  
 - >  using a module from website  and creating infrastructure accordingly
-> we need to provide all the values of variables specified in the module that doesnot have default values
*/



module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.0.0"
  # insert the 34 required variables here

/*    specified in :-     https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/blob/master/variables.tf
  */


  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }


}