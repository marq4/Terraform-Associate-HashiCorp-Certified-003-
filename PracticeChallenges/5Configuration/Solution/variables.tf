variable "web-server-ami" {
  type    = string
  default = "ami-0eed243341c128996"
}

variable "web-shape" {
  type    = string
  default = "t3.micro"
}

variable "web-server-names" {
  type    = set(string)
  default = ["web1", "web2", "web3"]
}