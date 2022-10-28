/*`
 resource  block is used to declare resource  attributes  like  ec2 , sg , vpc , volume .
*/





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



