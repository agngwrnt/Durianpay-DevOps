output "cloudwatch_alarms" {
  value = [
    aws_cloudwatch_metric_alarm.cpu_high.alarm_name,
    aws_cloudwatch_metric_alarm.memory_high.alarm_name,
    aws_cloudwatch_metric_alarm.status_check_failed.alarm_name,
    aws_cloudwatch_metric_alarm.network_in_high.alarm_name,
    aws_cloudwatch_metric_alarm.network_out_high.alarm_name
  ]
}