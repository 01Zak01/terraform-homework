variable region {
  description = "provide region"
  default = "us-east-1"
  type = string
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


variable key_name {
  description = "provide key"
  default = "public_key"
}


variable ports {
  description = "provide ports"
  type = list(number)
}

variable availability_zone {
  description = "provide az"
  default = ""
  type = string
}

variable "ec2_count" {
  type = number
  default = 1
}
