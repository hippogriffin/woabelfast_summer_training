#Configuring Backend
terraform {
    backend "s3" {
        bucket = "woajames"
        key = "woa/terraform.tfstate"
        region = "eu-west-2"
    }
}

#Creating Provider
provider "aws" {
    region = "${var.region}"
}

#Creating VPC
resource "aws_vpc" "JamesVPC" {
    cidr_block = "${var.VPC_cidr}"

    tags {
        Name = "JamesVPC"
    }
}

#Creating Subnet
resource "aws_subnet" "JamesSubnet" {
    vpc_id = "${aws_vpc.JamesVPC.id}"
    cidr_block = "${var.VPC_cidr}"

    tags {
        Name = "JamesSubnet"
    }
}

#Creating Security Group
resource "aws_security_group" "JamesSecurityGroup" {
    name = "allow_all"
    description = "Allow all traffic"
    vpc_id = "${aws_vpc.JamesVPC.id}"

  ingress {
      from_port = "${var.from}"
      to_port = "${var.to}"
      protocol = "${var.protocol}"
  }

  egress {
      from_port = "${var.from}"
      to_port = "${var.to}"
      protocol = "${var.protocol}"
  }
}

#Create Instance
resource "aws_instance" "JamesInstance" {
    ami = "${var.ami}"
    instance_type = "${var.type}"
    subnet_id = "${aws_subnet.JamesSubnet.id}"

    tags {
        Name = "JamesInstance"
    }
}