# Exercise 1
provider "aws" {
  region = "${var.zones}"
}

# Part 2 - VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc}"

tags {
    Name = "Cameron"
  }

}

# Part 3 - Subnet
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet}"

  tags {
    Name = "Cameron"
  }
}


# Part 4 - Security Group
resource "aws_security_group" "subnet" {
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    cidr_blocks = ["${aws_subnet.main.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}

# Part 5 - Instance
resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instancesize}"

  tags {
    Name = "Cameron"
  }
}

# Exercise 3
terraform {
  backend "s3" {
    bucket = "cameron-woa"
    key = "cameron/woa_dev.tfstate"
    region = "eu-west-1"
  }
}