resource "aws_instance" "web" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_http_instances.id]
  key_name = "windowsmachineakshaykp"
  provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo service httpd start",
            "sudo chkconfig httpd on"
        ]

        connection {
            type = "ssh"
            user = "ec2-user"
            host = aws_instance.web.public_ip
            private_key = file("${path.module}/windowsmachineakshaykp.pem")
        }
    }

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_http_instances.id]
  key_name = "windowsmachineakshaykp"
  provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo service httpd start",
            "sudo chkconfig httpd on"
        ]

        connection {
            type = "ssh"
            user = "ec2-user"
            host = aws_instance.web2.public_ip
            private_key = file("${path.module}/windowsmachineakshaykp.pem")
        }
    }

  tags = {
    Name = "HelloWorld"
  }
}