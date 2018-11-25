# terraform-aws-organizations-policy

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-organizations-policy.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-organizations-policy)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-organizations-policy.svg)](https://registry.terraform.io/modules/tmknom/organizations-policy/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-organizations-policy.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates AWS Organizations Policy resources on AWS.

## Description

Provision [Organizations Policy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html).

This module provides recommended settings:

- [Blacklist Strategy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_about-scps.html#orgs_policies_blacklist)

## Usage

### Minimal

```hcl
module "organizations_policy" {
  source       = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name         = "example"
  target_id    = "ou-12345678"
  deny_actions = ["cloudtrail:StopLogging"]
}
```

### Complete

```hcl
module "organizations_policy" {
  source       = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name         = "example"
  target_id    = "ou-12345678"
  deny_actions = ["cloudtrail:StopLogging"]

  description = "Example policy"
  type        = "SERVICE_CONTROL_POLICY"
  enabled     = "true"
}
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-organizations-policy/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-organizations-policy/tree/master/examples/complete)

## Inputs

| Name         | Description                                                                                                           |  Type  |         Default          | Required |
| ------------ | --------------------------------------------------------------------------------------------------------------------- | :----: | :----------------------: | :------: |
| deny_actions | List of strings that identify AWS services and actions that are denied by the statement.                              |  list  |            -             |   yes    |
| name         | The friendly name to assign to the policy.                                                                            | string |            -             |   yes    |
| target_id    | The unique identifier (ID) of the root, organizational unit, or account number that you want to attach the policy to. | string |            -             |   yes    |
| description  | A description to assign to the policy.                                                                                | string |  `Managed by Terraform`  |    no    |
| enabled      | Set to false to prevent the module from creating anything.                                                            | string |          `true`          |    no    |
| type         | The type of policy to create. Currently, the only valid value is SERVICE_CONTROL_POLICY (SCP).                        | string | `SERVICE_CONTROL_POLICY` |    no    |

## Outputs

| Name                     | Description                               |
| ------------------------ | ----------------------------------------- |
| organizations_policy_arn | Amazon Resource Name (ARN) of the policy. |
| organizations_policy_id  | The unique identifier (ID) of the policy. |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

#### Terraform variables for examples

```shell
export TF_VAR_target_id=ou-11111111
```

#### AWS credentials

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-organizations-policy.git
cd terraform-aws-organizations-policy
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/organizations-policy/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
