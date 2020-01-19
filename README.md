# Terraform Module for AWS ALB Cloudwatch Alarms

This Terraform module manages Cloudwatch Alarms for an ALB in the region. It does NOT create or manage Load Balancers, only Metric Alarms.

**Requires**:
- AWS Provider
- Terraform 0.12

## Alarms Created

Alarms Always Created:
- Any 5xx errors from the target group
- Any 5xx errors from the load balancer
- Unacceptably high average response times

**Estimated Operating Cost**: $ 0.30 / month

- $ 0.10 / month for Metric Alarms (3x)

## Example

```hcl-terraform
module "aws-efs-alarms" {
  source            = "lorenzoaiello/nat-alarms/aws"
  version           = "x.y.z"
}

```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| actions\_alarm | A list of actions to take when alarms are triggered. Will likely be an SNS topic for event distribution. | `list` | `[]` | no |
| actions\_ok | A list of actions to take when alarms are cleared. Will likely be an SNS topic for event distribution. | `list` | `[]` | no |
| evaluation\_period | The evaluation period over which to use when triggering alarms. | `string` | `"5"` | no |
| load\_balancer\_id | ALB ID | `string` | n/a | yes |
| prefix | Alarm Name Prefix | `string` | `""` | no |
| response\_time\_threshold | The average number of milliseconds that requests should complete within. | `string` | `"50"` | no |
| statistic\_period | The number of seconds that make each statistic period. | `string` | `"60"` | no |
| target\_group\_id | Target Group ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| alarm\_httpcode\_lb\_5xx\_count | The CloudWatch Metric Alarm resource block for 5xx errors on the load balancer |
| alarm\_httpcode\_target\_5xx\_counts | The CloudWatch Metric Alarm resource block for 5xx errors on the target group |
| alarm\_target\_response\_time\_average | The CloudWatch Metric Alarm resource block for unacceptably high response time averages |
