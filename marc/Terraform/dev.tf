provider "aws" {
  region = "eu-west-1"
}

variable "subnet_id" {
  default = "172.16.0.0/12"	
  
}

variable "ami" {
  default = "ami-3548444c"
}

resource "aws_instance" "dev" {
    ami = "${var.ami}" 
    instance_type = "t2.micro"
}


resource "aws_security_group" "subnet" {
  vpc_id = ""

  ingress {
    cidr_blocks = ["${var.subnet_id}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}
