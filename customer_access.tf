module "customer_role_production" {
  source         = "./modules/customer-role"
  trusted_entity = "arn:aws:iam::${aws_organizations_account.users.id}:root"

  providers = {
    aws = aws.production
  }
}

module "customer_group_production" {
  source     = "./modules/customer-group"
  group_name = "customersProduction"

  assume_role_arns = [
    module.customer_role_production.role_arn
  ]

  providers = {
    aws = aws.users
  }
}

resource "aws_iam_group" "self_managing" {
  name = "SelfManaging"

  provider = aws.users
}

resource "aws_iam_group_policy_attachment" "iam_read_only_access" {
  group      = aws_iam_group.self_managing.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"

  provider = aws.users
}

resource "aws_iam_group_policy_attachment" "iam_self_manage_service_specific_credentials" {
  group      = aws_iam_group.self_managing.name
  policy_arn = "arn:aws:iam::aws:policy/IAMSelfManageServiceSpecificCredentials"

  provider = aws.users
}

resource "aws_iam_group_policy_attachment" "iam_user_change_password" {
  group      = aws_iam_group.self_managing.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"

  provider = aws.users
}

resource "aws_iam_policy" "self_manage_vmfa" {
  name   = "SelfManageVMFA"
  policy = file("${path.module}/data/self_manage_vmfa.json")

  provider = aws.users
}

resource "aws_iam_group_policy_attachment" "self_manage_vmfa" {
  group      = aws_iam_group.self_managing.name
  policy_arn = aws_iam_policy.self_manage_vmfa.arn

  provider = aws.users
}
