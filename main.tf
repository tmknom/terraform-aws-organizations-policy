# Terraform module which creates AWS Organizations Policy resources on AWS.
#
# https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html

# https://www.terraform.io/docs/providers/aws/r/organizations_policy.html
resource "aws_organizations_policy" "default" {
  name        = "${var.name}"
  description = "${var.description}"
  type        = "${var.type}"
  content     = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
  statement {
    effect    = "Deny"
    resources = ["*"]
    actions   = ["${var.deny_actions}"]
  }
}
