output "users_summary" {
  value = [
    module.vodafone-aws.summary
  ]
}

output "links" {
  value = {
    aws_console_sign_in    = "https://${aws_organizations_account.users.id}.signin.aws.amazon.com/console/"
    switch_role_production = "https://signin.aws.amazon.com/switchrole?account=${aws_organizations_account.production.id}&roleName=${urlencode(module.customer_role_staging.role_name)}&displayName=${urlencode("Customer@production")}"
  }
}
