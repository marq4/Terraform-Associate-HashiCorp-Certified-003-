resource "aws_instance" "web-servers" {
  ami           = var.web-server-ami
  instance_type = var.web-shape
  count         = length(var.web-server-names)
  tags = {
    Name = var.web-server-names[count.index]
  }
}