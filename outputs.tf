output "alarm_httpcode_target_5xx_counts" {
  value       = aws_cloudwatch_metric_alarm.httpcode_target_5xx_count
  description = "The CloudWatch Metric Alarm resource block for 5xx errors on the target group"
}

output "alarm_httpcode_lb_5xx_count" {
  value       = aws_cloudwatch_metric_alarm.httpcode_lb_5xx_count
  description = "The CloudWatch Metric Alarm resource block for 5xx errors on the load balancer"
}

output "alarm_target_response_time_average" {
  value       = aws_cloudwatch_metric_alarm.target_response_time_average
  description = "The CloudWatch Metric Alarm resource block for unacceptably high response time averages"
}
