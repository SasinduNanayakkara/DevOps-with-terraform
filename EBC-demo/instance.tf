resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  #the vpc subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  #the vpc security groups
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  #the public SSH key
    key_name = "${aws_key_pair.mykeypair.key_name}"
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1b"
    size = 20
    volume_type = "gp2"
    tags = {
        Name = "ebs-volume-data"
    }
}

resource "aws_volume_attachment" "ebs-vlume-1-attachment" {
  device_name = "/dev/xvdf"
  instance_id = "${aws_instance.example.id}"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
}
