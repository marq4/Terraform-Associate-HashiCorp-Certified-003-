
variable "latest-ubuntu-ami-ohio" {
  type    = string
  default = "ami-0210f89245b72a769"
}

variable "dynamic_instance_type_per_env" {
  type        = map(string)
  description = "Different shape per env (workspace). "
  default = {
    "dev"  = "t3.micro"
    "prod" = "m5.large"
  }
}

variable "environment_tag" {
  type = map(string)
  default = {
    "dev"  = "Development"
    "prod" = "Production"
  }
}
