variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  description = "Environment name (preprod | prod)"
}

variable "environments" {
  description = "Environment configuration map"
  type        = map(any)
}