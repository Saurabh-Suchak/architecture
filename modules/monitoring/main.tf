resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/${var.project_name}/logs"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
}


output "log_group_name" {

  value       = aws_cloudwatch_log_group.app_logs.name
}

output "alarm_name" {
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}


