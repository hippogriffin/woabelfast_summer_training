#configure provider
provider "aws" {
    shared_credentials_file = "$HOME/.aws/credentials/aws-secret"
    region = "${var.region}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.40.0"
}

#configure subnet
resource "aws_subnet" "ek-webops-subnet" {
    vpc_id = "${aws_vpc.ek-webops-vpc.id}"
    cidr_block = "10.0.0.0/16"

    tags { 
       Name = "EK-WebOps-Subnet"
    }
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.2.0"
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.10.0"
}