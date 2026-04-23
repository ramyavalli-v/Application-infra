variable "name" {}
variable "subnets" {}
variable "launch_template_id" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
variable "target_group_arn" {}
variable "tags" {
  type = map(string)
}