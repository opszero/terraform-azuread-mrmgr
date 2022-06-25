module "control_tower" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"

  # Required Vars
  # Need to customize these manually in the Console
  ct_management_account_id    = "111122223333"
  log_archive_account_id      = "444455556666"
  audit_account_id            = "123456789012"
  aft_management_account_id   = "777788889999"
  ct_home_region              = "us-east-1"
  tf_backend_secondary_region = "us-west-2"

  # VCS Vars
  # TODO: Need to clone the following https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main/sources/
  #
  vcs_provider                                  = "github"
  account_request_repo_name                     = "ExampleOrg/example-repo-1"
  global_customizations_repo_name               = "ExampleOrg/example-repo-2"
  account_customizations_repo_name              = "ExampleOrg/example-repo-3"
  account_provisioning_customizations_repo_name = "ExampleOrg/example-repo-4"
}
