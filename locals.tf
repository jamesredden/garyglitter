locals {
  account_name = {
    production = "vf-customer-production"
  }

  # Use existing emails, in case of the account recovery
  account_owner_email = {
    production = "james.redden@vodafone.com"
  }

  terraform_state_bucket_name = {
    production = "vf-customer-production"
  }
}