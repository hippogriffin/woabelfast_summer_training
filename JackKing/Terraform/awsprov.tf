# Variables


# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-2"
}


# VPC resource
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "Jack's VPC"
  }
}


# Security
 resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


# Instance
resource "aws_instance" "web" {
  ami           = "ami-00846a67"
  instance_type = "t2.micro"

  tags {
    Name = "Jack's Instance"
  }
}
