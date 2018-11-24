output "organizations_policy_id" {
  value       = "${element(concat(aws_organizations_policy.default.*.id, list("")), 0)}"
  description = "The unique identifier (ID) of the policy."
}

output "organizations_policy_arn" {
  value       = "${element(concat(aws_organizations_policy.default.*.arn, list("")), 0)}"
  description = "Amazon Resource Name (ARN) of the policy."
}
