
# Read server names from file:
locals {
  web_server_names = split("\n", trimspace(file(var.server-names-file)))
}

# Validate num_servers and length of server_names match:
locals {
  server_names_match_server_count = length(local.web_server_names) == var.number_of_web_servers
}

# Enforce with precondition:
resource "null_resource" "validate_server_names_length" {
  lifecycle {
    precondition {
      condition     = local.server_names_match_server_count
      error_message = "Please specify names of web servers equal to the number of desired servers (length(server_names) variable must match number_of_web_servers variable)."
    }
  }
}

resource "aws_instance" "web-servers" {
  count         = length(toset(local.web_server_names))
  ami           = var.ami
  instance_type = var.web_instance_types[var.env]
  tags = {
    name = local.web_server_names[count.index]
  }
}
