output "organizations_policy_id" {
  value       = "${aws_organizations_policy.default.id}"
  description = "The unique identifier (ID) of the policy."
}

output "organizations_policy_arn" {
  value       = "${aws_organizations_policy.default.arn}"
  description = "Amazon Resource Name (ARN) of the policy."
}
