
provider aws {
    region = var.region
}


resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
  key_name = var.key_name
  security_groups = [aws_security_group.allow_tls.name]
  availability_zone = var.availability_zone
  count = var.ec2_count
}

