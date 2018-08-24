#configure instance
resource "aws_instance" "ek-webops-instance" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "EK-WebOps-Instance"
   }
}