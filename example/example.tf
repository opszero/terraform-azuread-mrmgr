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
  github = {
    app = {
      sign_in_audience  = "AzureADMyOrg"
      alternative_names = []
      repos             = "opszero/app"
      entity_type       = "pull_request" # for branch ref:refs/heads/<branch name>
    },
    api = {
      sign_in_audience  = "AzureADMyOrg"
      alternative_names = []
      repos             = "opszero/api"
      entity_type       = "pull_request" # for branch ref:refs/heads/<branch name>
    }
  }
}

