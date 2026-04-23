variable "environment" {
  type = string
}

variable "environments" {
  type = map(any)
}

variable "region" {
  type    = string
  default = "ap-south-1"
}