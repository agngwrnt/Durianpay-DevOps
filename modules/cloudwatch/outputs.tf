output "cpu_high_alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_high.alarm_name
}

output "memory_high_alarm_name" {
  value = aws_cloudwatch_metric_alarm.memory_high.alarm_name
}

output "status_check_failed_alarm_name" {
  value = aws_cloudwatch_metric_alarm.status_check_failed.alarm_name
}

output "network_in_high_alarm_name" {
  value = aws_cloudwatch_metric_alarm.network_in_high.alarm_name
}

output "network_out_high_alarm_name" {
  value = aws_cloudwatch_metric_alarm.network_out_high.alarm_name
}
