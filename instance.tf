resource "aws_instance" "example1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.example-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  
  user_data = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'inet 10' | awk '{ print $2 }'`\necho 'this is: '$MYIP > /var/www/html/index.html"

}

resource "aws_instance" "example2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-2.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.example-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  user_data = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'inet 10' | awk '{ print $2 }'`\necho 'this is: '$MYIP > /var/www/html/index.html"

}


resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-east-2a"
    size = 20
    type = "gp2" 
    tags {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example1.id}"
}


