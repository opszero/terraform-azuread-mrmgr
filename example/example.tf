terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 2.84"
      }
  }

}

# Configure the Azure Active Directory Provider
provider "azuread" {}

module "openid" {
  source = "./.."
  service_principal_name = "test"
  github = {
    api =  {
      repos = "opszero/testrepo"
      entity_type = "pull_request" # for branch ref:refs/heads/<branch name>
  }
  }
}


output "clientid" {
  value = module.openid.clientid
}

output "app_id" {
  value = module.openid.app_id
}
