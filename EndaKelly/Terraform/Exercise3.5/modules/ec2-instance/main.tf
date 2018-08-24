module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "ek-webops-instance"
  instance_count = 1
  
  ami                    = "ami-ami-3548444c"
  instance_type          = "t2.micro"
  key_name               = ""
  vpc_security_group_ids = [""]
  subnet_id              = ""

  tags = {
    Name = "EK-WebOps-Instance"
  }
}