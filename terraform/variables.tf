variable "env" {
  type    = map(string)
  default = {}
}

variable "public_subnets" {
  type    = map(string)
  default = {}
}

variable "ssh_public_key" {
  type = string
}

variable "instance_size" {
  type = string
}