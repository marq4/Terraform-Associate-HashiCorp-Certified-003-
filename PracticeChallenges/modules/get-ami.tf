
variable "target-region" {
  type = string
}

provider aws {
  region = var.target-region
}

data "aws_ami" "get-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu*gp3*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ubuntu-ami" {
  value = data.aws_ami.get-ami.image_id
}
