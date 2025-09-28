resource "aws_instance" "web-server" {
  ami           = var.latest-ubuntu-ami-ohio
  instance_type = lookup(var.dynamic_instance_type_per_env, terraform.workspace)
  tags = {
    Environment = lookup(var.environment_tag, terraform.workspace)
  }
}