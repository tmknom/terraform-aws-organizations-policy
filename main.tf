# Terraform module which creates AWS Organizations Policy resources on AWS.
#
# https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html

# https://www.terraform.io/docs/providers/aws/r/organizations_policy.html
resource "aws_organizations_policy" "default" {
  count = "${length(var.deny_actions) > 0 ? 1 : 0}"

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

resource "aws_organizations_policy_attachment" "default" {
  count = "${length(var.deny_actions) > 0 ? 1 : 0}"

  policy_id = "${aws_organizations_policy.default.id}"
  target_id = "${var.target_id}"
}
