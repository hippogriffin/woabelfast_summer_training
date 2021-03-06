#configure provider
provider "aws" {
    shared_credentials_file = "$HOME/.aws/credentials/aws-secret"
    region = "${var.region}"
}

#configure vpc
resource "aws_vpc" "ek-webops-vpc" {
   cidr_block = "10.0.0.0/16"

   tags {
       Name = "EK-WebOps-VPC"
   }
}

#configure subnet
resource "aws_subnet" "ek-webops-subnet" {
    vpc_id = "${aws_vpc.ek-webops-vpc.id}"
    cidr_block = "10.0.0.0/16"

    tags { 
       Name = "EK-WebOps-Subnet"
    }
}

#configure security group
resource "aws_security_group" "ek-webops-security-group" {
    vpc_id = "${aws_vpc.ek-webops-vpc.id}"

ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
}

tags {
    Name = "EK-WebOps-Security-Group"
}
}

#configure instance
resource "aws_instance" "ek-webops-instance" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "EK-WebOps-Instance"
   }
}