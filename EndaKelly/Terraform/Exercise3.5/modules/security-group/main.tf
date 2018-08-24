#configure security group
resource "aws_security_group" "ek-webops-security-group" {
    #vpc_id = "${aws_vpc.ek-webops-vpc.id}"

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