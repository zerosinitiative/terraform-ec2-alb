resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-c0705cba"

  ingress {
    description = "LB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LB security group"
  }
}

resource "aws_security_group" "allow_http_instances" {
  name        = "allow_http_instances"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-c0705cba"

  ingress {
    description = "instance"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.allow_http.id]
  }

  ingress {
    description = "instance2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LB security group"
  }
}