resource "aws_autoscaling_policy" "example-cpu-policy" {
  name = "example-cpu-policy"
    adjustment_type = "ChangeInCapacity"
    autoscaling_group_name = aws_autoscaling_group.example-aws_autoscaling.name
    cooldown = 300
    scaling_adjustment = "1"
    policy_type = "SimpleScaling"  
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm" {
  alarm_name = "example-cpu-name"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    statistic = "Average"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    threshold = "30"
    period = "120"
    evaluation_periods = "2"
    alarm_description = "example-cpu-name"
    dimensions = {
        "AutoScalingGroupName" = aws_autoscaling_group.example-aws_autoscaling.name
    }

    actions_enabled = true
    alarm_actions = [
        aws_autoscaling_policy.example-cpu-policy.arn
    ]
}

#scale down alarm
resource "aws_autoscaling_policy" "example-cpu-policy-scaledown" {
  name = "example-cpu-policy-scaledown"
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.example-aws_autoscaling.name
  cooldown = 300
  scaling_adjustment = "-1"
  policy_type = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-amarm-scaledown" {
  alarm_name = "example-cpu-alarm-scaledown"
  alarm_description = "example-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "5"
    actions_enabled = true
    alarm_actions = [
        aws_autoscaling_policy.example-cpu-policy-scaledown.arn
    ]
    dimensions = {
        "AutoScalingGroupName" = aws_autoscaling_group.example-aws_autoscaling.name
    }
}