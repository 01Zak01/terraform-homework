
provider aws {
    region = var.region
}
variable region {
  description = "provide region"
  default = "us-east-1"
  type = string
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
}
variable ami_id {
    description = "provide ami id"
    default = "ami-051f8a213df8bc089"
    type = string
}
variable type {
  description = "provide type"
  default = "t2.micro"
}

resource "aws_key_pair" "key" {
  key_name   = "key"
public_key = file("~/.ssh/id_rsa.pub")
}
variable key_name {
  description = "provide key"
  default = "public_key"
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


variable ports {
  description = "provide ports"
  default = ""
  type = string
}

variable availability_zone {
  description = "provide az"
  default = ""
  type = string
}

variable "count" {
  count = var.instance_count
  default = ""
}


region = "us-east-1"
ami_id = "ami-051f8a213df8bc089"
type = "t2.micro"
instance_count = 1

region = "us-east-2"
ami_id = "ami-0900fe555666598a2"
type = "t2.micro"

region = "us-west-2"
ami_id = "ami-0395649fbe870727e"
type = "t2.micro"

region = "us-west-1"
ami_id = "ami-0b990d3cfca306617"
type = "t2.micro"