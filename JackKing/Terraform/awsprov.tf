# Variables
variable "region" {
 default = "eu-west-2" 
}
variable "ami" {
 default = "ami-00846a67"
}
variable "instance_type" {
 default = "t2.micro"
}


# Configure the AWS Provider
provider "aws" {
  region     = "${var.region}"
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
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "Jack's Instance"
  }
}

# Store state file in S3 bucket
terraform {
 backend "s3" {
   bucket = "jackwoa"
   key    = "terraform.tfstate"
   region = "eu-west-2"
 }
}