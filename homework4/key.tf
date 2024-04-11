resource "aws_key_pair" "key" {
  key_name   = var.key_name
public_key = file("~/.ssh/id_rsa.pub")
}
