resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/ecs/ecommerce-service"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "CPUUtilizationHigh"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    ClusterName = module.ecs_cluster.cluster_id
  }
}

resource "aws_sns_topic" "alerts" {
  name = "ecs-alerts"
}
