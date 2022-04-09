resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

#VPC subnets
subnet_id = "${aws_subnet.main-public-1.id}"

#VPC security groups
#security_group_ids = ["${aws_security_group.allow-ssh.id}"]

#the public SSH key
key_name = "${aws_key_pair.mykeypair.key_name}"
}