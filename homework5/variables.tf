variable "region" {
  type        = string
  description = "provide region"
}

variable vpc_settings {
  type = list(object({
  vpc_cidr = string
  dns_support_host = bool
  dns_support = bool
  }))
}

variable "subnet_cidr" {
  type = list(object({
    cidr        = string
    subnet_name = string
  }))
}

variable "ip_on_launch" {
  type = bool
}

variable "ec2" {
  type = list(object({
    instance_type = string
    name          = string
  }))
}

variable "ami_id" {
  description = "provide ami id"
  default     = "ami-0395649fbe870727e"
  type        = string
}

variable "key_name" {
  description = "provide key"
  default     = "public_key"
}

variable "internet_gateway_name" {
  description = "provide igw"
  type        = string
}

variable "rt_name" {
  type        = list(string)
  description = "provide name"
}

variable "ports" {
  type        = list(number)
  description = "list of ports"
}

