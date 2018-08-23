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

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Marcs VPC"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

terraform {
  backend "s3" {
    bucket = "woamarc"
    key    = "woa/dev.tfstate"
    region = "eu-west-1"
  }
}