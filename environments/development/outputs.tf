output "cloudwatch_alarms" {
  value = [
    aws_cloudwatch_metric_alarm.cpu_high.alarm_name,
    aws_cloudwatch_metric_alarm.memory_high.alarm_name,
    aws_cloudwatch_metric_alarm.status_check_failed.alarm_name,
    aws_cloudwatch_metric_alarm.network_in_high.alarm_name,
    aws_cloudwatch_metric_alarm.network_out_high.alarm_name
  ]
}

output "vpc_id" {
  description = "VPC ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.vpc.private_subnet_id
}

output "autoscaling_group_id" {
  description = "ID of the Auto Scaling Group"
  value       = module.autoscaling.asg_id
}

output "cloudwatch_alarm_names" {
  description = "List of CloudWatch alarm names"
  value       = [
    module.cloudwatch.cpu_high,
    module.cloudwatch.memory_high,
    module.cloudwatch.status_check_failed,
    module.cloudwatch.network_in_high,
    module.cloudwatch.network_out_high,
  ]
}

