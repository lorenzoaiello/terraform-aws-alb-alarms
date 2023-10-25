# Terraform Module for AWS ALB CloudWatch Alarms

This Terraform module manages CloudWatch Alarms for an ALB in the region. It does NOT create or manage Load Balancers, only Metric Alarms.

**Requires**:

- AWS Provider
- Terraform 0.12

## Alarms Created

Alarms Always Created:

- Any 5xx errors from the target group
- Any 5xx errors from the load balancer
- Unacceptably high average response times
- Number of unhealthy hosts
- Number of healthy hosts

**Estimated Operating Cost**: $ 0.50 / month

- $ 0.10 / month for Metric Alarms (5x)

## Example

```hcl-terraform
module "aws-alb-alarms" {
  source            = "lorenzoaiello/alb-alarms/aws"
  version           = "x.y.z"
}

```

## Variables

| Name                      | Description                                                                                              | Type     | Default | Required |
| ------------------------- | -------------------------------------------------------------------------------------------------------- | -------- | ------- | :------: |
| actions_alarm             | A list of actions to take when alarms are triggered. Will likely be an SNS topic for event distribution. | `list`   | `[]`    |    no    |
| actions_ok                | A list of actions to take when alarms are cleared. Will likely be an SNS topic for event distribution.   | `list`   | `[]`    |    no    |
| evaluation_period         | The evaluation period over which to use when triggering alarms.                                          | `string` | `"5"`   |    no    |
| load_balancer_id          | ALB ID                                                                                                   | `string` | n/a     |   yes    |
| prefix                    | Alarm Name Prefix                                                                                        | `string` | `""`    |    no    |
| response_time_threshold   | The average number of milliseconds that requests should complete within.                                 | `string` | `"50"`  |    no    |
| unhealthy_hosts_threshold | The number of unhealthy hosts.                                                                           | `string` | `"0"`   |    no    |
| healthy_hosts_threshold   | The number of healthy hosts.                                                                             | `string` | `"0"`   |    no    |
| httpcode_target_5xx_count_threshold | The number of target 5xx errors to trigger the alarm                                           | `string` | `"0"`   |    no    |
| httpcode_lb_5xx_count_threshold | The number of lb 5xx errors to trigger the alarm                                                   | `string` | `"0"`   |    no    |
| statistic_period          | The number of seconds that make each statistic period.                                                   | `string` | `"60"`  |    no    |
| target_group_id           | Target Group ID                                                                                          | `string` | n/a     |   yes    |

## Outputs

| Name                               | Description                                                                             |
| ---------------------------------- | --------------------------------------------------------------------------------------- |
| alarm_httpcode_lb_5xx_count        | The CloudWatch Metric Alarm resource block for 5xx errors on the load balancer          |
| alarm_httpcode_target_5xx_counts   | The CloudWatch Metric Alarm resource block for 5xx errors on the target group           |
| alarm_target_response_time_average | The CloudWatch Metric Alarm resource block for unacceptably high response time averages |
