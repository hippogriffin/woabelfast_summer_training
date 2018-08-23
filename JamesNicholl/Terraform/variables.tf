variable "region" {
    default = "eu-west-2"
}

variable "VPC_cidr" {
    default = "10.0.0.0/16"
}

variable "Subnet_cidr" {
    default = "10.1.0.0/16"
}

variable "from" {
    default = "0"
}

variable "to" {
    default = "0"
}

variable "protocol" {
    default = "-1"
}

variable "ami" {
    default = "ami-00846a67"
}

variable "type" {
    default = "t2.micro"
}