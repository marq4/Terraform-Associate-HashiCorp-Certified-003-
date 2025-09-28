
module "get-ohio-ubuntu-ami" {
  source        = "../modules/get-ubuntu-ami-for-region"
  target-region = "us-east-2"
}

output "ubuntu-ami-for-ohio" {
  value = module.get-ohio-ubuntu-ami.ubuntu-ami
}

