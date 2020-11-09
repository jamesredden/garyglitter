# AWS Organization Example

## About

This repository contains all the necessary code to create:

* AWS organization with one account:
  * production
* IAM groups and roles for admin,
* S3 bucket and KMS key

## Quickstart

1. Substitute the dummy values in [locals.tf](locals.tf).
1. Initialize the Terraform and apply plan:
    ```
    $ terraform init
    $ terraform apply
    ```
1. Commit the state in `terraform.tfstate` to the respective VF repository and you're done!

