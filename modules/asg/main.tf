resource "aws_autoscaling_group" "this" {
  name                = var.name
  vpc_zone_identifier = var.subnets
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  health_check_type   = "ELB"
  target_group_arns  = [var.target_group_arn]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}