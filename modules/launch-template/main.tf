resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.app_ec2_profile.name
  }
  user_data = base64encode(var.user_data)
  network_interfaces {
    security_groups = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}