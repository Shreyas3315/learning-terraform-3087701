resource "aws_instance" "web" {
  ami           = ami-12345678
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
