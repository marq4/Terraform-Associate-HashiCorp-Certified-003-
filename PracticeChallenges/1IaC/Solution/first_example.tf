
resource "local_file" "tf-managed-file" {
  filename = "tf-managed-file.txt"
  content  = "I love Terraform!"
}
