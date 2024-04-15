data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ubu" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2[0].instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("apache.sh")
  tags = {
    Name = var.ec2[0].name
  }
  #   associate_public_ip_address = true
}

resource "aws_instance" "amz" {
  ami             = var.ami_id
  instance_type   = var.ec2[1].instance_type
  key_name        = var.key_name
  subnet_id       = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data       = file("amazon_apache.sh")
  tags = {
    Name = var.ec2[1].name
  }
}

output "public_ip" {
  value = aws_instance.ubu.public_ip
  

}