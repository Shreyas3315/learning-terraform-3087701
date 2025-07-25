data "aws_vpc" "default"{
  default = true
}
resource "aws_instance" "blog" {
  ami           = "ami-12345678"
  instance_type = "t3.nano"

  vpc_security_group_ids = [aws_security_group.id]
  
  tags = {
    Name = "HelloWorld"
  }
  
}
resource "aws_security_group" "blog"{
  name = "blog"
  description = "Allow http and https in. Allow everything out"

  vpc_id = data.aws_vpc.default.id
}
resource "aws_security_group_rule" "blog_http_in"{
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.blog.id
}
resource "aws_security_group_rule" "blog_https_in"{
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.blog.id
}
resource "aws_security_group_rule" "blog_everything_out"{
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.blog.id
}

