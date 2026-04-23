resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type

  network_interfaces {
    security_groups = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}