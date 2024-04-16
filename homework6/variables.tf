variable "region" {
  default = ""
  type    = string
}

variable "instance_type" {
  type = string
}


variable "key_name" {
  description = "provide key"
  default     = "public_key"
}