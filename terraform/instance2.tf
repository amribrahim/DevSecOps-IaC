data "aws_ami" "ubuntu2" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "second_instance" {
  ami           = "${data.aws_ami.ubuntu2.id}"
  instance_type = "t2.micro"
 # private_ip ="172.31.70.105"
  subnet_id = "${aws_subnet.prod-pub-1.id}"
#  key_name = "${aws_key_pair.deployer.id}"
   key_name= "key.pem"
 # iam_instance_profile = "${aws_iam_instance_profile.code_deploy.name}"
   vpc_security_group_ids = ["${aws_security_group.SG-instance.id}"]

  tags = {
    Name = "instance2"
  }
}






