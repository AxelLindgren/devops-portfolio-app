variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "app_ingress_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ssh_ingress_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
