resource "aws_instance" "EC2-lab1" {
  ami = var.ami_type  
  instance_type = var.instance_type

}