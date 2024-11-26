# Launch Configuration
resource "aws_launch_configuration" "my-launch-config" {
  name          = "${var.environment}-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = false
}

# Auto Scaling Group
resource "aws_autoscaling_group" "my-asg" {
  launch_configuration = aws_launch_configuration.my-launch-config.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids # Private Subnets

  tags = [
    {
      key                 = "Name"
      value               = "${var.environment}-asg-instance"
      propagate_at_launch = true
    }
  ]
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${var.environment}-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.my-asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.environment}-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = var.cpu_threshold
  actions_enabled     = true

  alarm_actions = [aws_autoscaling_policy.scale_out.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.my-asg.name
  }
}

output "asg_id" {
  value = aws_autoscaling_group.my-asg.id
}
