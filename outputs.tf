output "organizations_policy_id" {
  value       = "${join("", aws_organizations_policy.default.*.id)}"
  description = "The unique identifier (ID) of the policy."
}

output "organizations_policy_arn" {
  value       = "${join("", aws_organizations_policy.default.*.arn)}"
  description = "Amazon Resource Name (ARN) of the policy."
}
