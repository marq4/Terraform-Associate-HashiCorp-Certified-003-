
# Interactively, specify values in a list: [2, false, "app"]
resource "aws_instance" "tuple-servers" {
  count         = var.servers_template[0]
  ami           = var.ami
  instance_type = local.special_instance_type
  tags = {
    "Name" : "${var.servers_template[2]}${count.index + 1}"
    "Detailed_Monitoring" : tostring(var.servers_template[1])
  }
}
