variable "name" {}
variable "instance_type" {}
variable "tags" {}


variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instances"
  type        = list(string)
}


variable "user_data" {
  type        = string
  description = "User data script for EC2 instances"
}


variable "account_id" {
  type        = string
  description = "AWS account ID"
}
