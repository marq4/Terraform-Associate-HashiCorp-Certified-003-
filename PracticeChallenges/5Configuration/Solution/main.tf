resource "aws_instance" "web-servers" {
  ami           = var.web-server-ami
  instance_type = var.web-shape
  for_each      = var.web-server-names
  tags = {
    Name = each.value
  }
}