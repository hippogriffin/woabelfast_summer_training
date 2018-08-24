variable "zones" {
  default = "eu-west-1"
}

variable "vpc" {
    default = "10.0.0.0/16"
}

variable "subnet" {
    default = "10.0.1.0/24"
}


variable "ami" {
    default = "ami-3548444c"
}

variable "instancesize" {
    default = "t2.micro"
}
