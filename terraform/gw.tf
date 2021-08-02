resource "aws_internet_gateway" "nile-gateway" {
  vpc_id = "${aws_vpc.nile-vpc.id}"

  tags = {
    Name = "nile-gateway"
  }
}


