# Create Homework3 folder and perform following:
# Provision 3 EC2 instances with one resource block in the us-west-2 region.
# Instances type should be t2.micro.
# Use the latest Amazon Linux 2 AMI for the instance.
# Create security group with inbounds ports 22, 80, 443 and 3306 open and attach to the Instances.
# Add Bastion key to the Instances.
# Ensure EC2 instances are accessible over the internet. Assign a public IP address.
# Ensure EC2 instances created in each AZ.
# Ensure instances names are: web-1, web-2, web-2.
# Automatically install Apache web server and create a simple webpage that returns "Hello, World!" when visited.



provider "aws" {
  region = "us-west-2"
}


resource "aws_key_pair" "keypair" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")

}

data "aws_ami" "aws-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  owners = ["amazon"]
}

data "aws_availability_zones" "zona" {}


resource "aws_instance" "linux" {
  ami                    = data.aws_ami.aws-linux-2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = aws_key_pair.keypair.key_name
  count                  = 3
  tags = {
    Name = "web-${count.index+1}"
  }
  user_data              = file("apache.sh")
  user_data_replace_on_change = true
  availability_zone = data.aws_availability_zones.zona.names[count.index]
}

output "linux2" {
  value = aws_instance.linux[*].public_ip

}