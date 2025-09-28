
variable "env" {
  type        = string
  description = "Environment to deploy to: dev|prod. Default: dev. Override with -var env=prod. "
  default     = "dev"
}

variable "server-names-file" {
  type        = string
  description = "Text file that contains the names of the web servers. "
  default     = "web-server-names.txt"
}

variable "number_of_web_servers" {
  type        = number
  description = "How many servers we want for this project. "
  default     = 2
}

# Enable with -var detailed_monitoring=true:
variable "detailed_monitoring" {
  type        = bool
  description = "Toggle detailed monitoring (costs $$$). Enable only for debugging. "
  default     = false
}

variable "ami" {
  type        = string
  description = "AMI to be used by EC2 servers. "
  validation {
    condition     = substr(var.ami, 0, 4) == "ami-"
    error_message = "AMI should start with 'ami-'."
  }
}

#variable "server_names" {
#type        = list(string)
#description = "Hardcoded values for web servers. "
#default     = file(var.server-names-file) # Not possible.
# Not possible:
#validation {
#  condition     = length(var.server_names) == var.number_of_servers
#  error_message = "List of server names must match number_of_servers."
#}
#}

variable "web_instance_types" {
  type        = map(string)
  description = "Set instance shape depending on environment. "
  default = {
    "dev"  = "t3.micro" # var.dev-type: not possible. 
    "prod" = "m5.large" # var.prod-type: not possible.
  }
}

variable "servers_template" {
  description = "How many servers, detailed monitoring, name prefix. "
  type        = tuple([number, bool, string])
}

variable "is_db" {
  type        = bool
  description = "Set to true if servers will be RDS Data Bases. "
  default     = false
}

locals {
  instance_type_map = {
    dev = {
      normal = "t3.micro"
      db     = "db.t3.micro"
    }
    prod = {
      normal = "m5.large"
      db     = "db.m5.large"
    }
  }
  special_instance_type = local.instance_type_map[var.env][var.is_db ? "db" : "normal"]
}
