# Setting up variables 
variable "ami" {
  default = "ami-3548444c" 
}
variable "instance_type" {
  default = "t2.micro" 
}

variable "region" {
  default = "eu-west-1"
}

###################################################

# Configure the AWS Provider
provider "aws" {
  region= "eu-west-1"
}

# Provides a VPC resource
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  # Name the VPC (viewable on Amazon)
  tags 
  {
    Name = "Brians VPC"
  }
}

# Provides a VPC Subnet resource
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  }

# Add Security Group
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

# Adds an instance 
# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "HelloWorld"
  }
}


# Storage of state file into S3 bucket
terraform {
  backend "s3" {
    bucket = "brian-webops-academy"
    key    = "Terraform/dev.tf"
    region = "eu-west-1"
  }
}