resource "aws_eip" "nile-nat1" {
tags = {
    Name = "nile-nat1"
  }
}




resource "aws_nat_gateway" "nile-ngw1" {
  allocation_id = "${aws_eip.nile-nat1.id}"
  subnet_id     = "${aws_subnet.prod-pub-1.id}"

  tags = {
    Name = "nile-NAT1"
  }
}




