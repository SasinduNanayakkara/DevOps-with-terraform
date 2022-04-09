resource "aws_security_group" "allow-ssh" {
  vpc_id = aws_vpc.main.id
  name = "allow-ssh"
  description = "security group that allows ssh and egress traffic"

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }

    tags = {
        Name = "allow-ssh"
    }
}