resource "aws_instance" "blog" {
  ami           = "ami-12345678"
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
