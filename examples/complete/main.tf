module "organizations_policy" {
  source       = "../../"
  name         = "example"
  target_id    = "${local.target_id}"
  deny_actions = ["cloudtrail:StopLogging"]

  description = "Example policy"
  type        = "SERVICE_CONTROL_POLICY"
  enabled     = "true"
}

locals {
  target_id         = "${var.target_id != "" ? var.target_id : local.default_target_id}"
  default_target_id = "ou-12345678"
}

variable "target_id" {
  default     = ""
  type        = "string"
  description = "If TF_VAR_target_id set in the environment variables, then use that value."
}
