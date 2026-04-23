variable "name" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "tags" {
  type = map(string)
}