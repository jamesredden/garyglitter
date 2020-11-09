provider "aws" {
  region = "eu-central-2"
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
  }

  alias  = "production"
  region = "eu-central-2"
}

resource "aws_organizations_organization" "organization" {
}

resource "aws_organizations_account" "production" {
  name      = local.account_name["production"]
  email     = local.account_owner_email["production"]
  role_name = "Admin"
}

