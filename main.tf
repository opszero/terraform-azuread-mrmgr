data "azuread_client_config" "current" {}

resource "azuread_application" "main" {
  display_name     = var.service_principal_name
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = var.sign_in_audience
}

resource "azuread_service_principal" "main" {
  application_id    = azuread_application.main.application_id
  owners            = [data.azuread_client_config.current.object_id]
  alternative_names = var.alternative_names
}

provider "azurerm" {
  alias = "azurerm"
  features {}
}

data "azurerm_subscription" "current" {
  provider = azurerm.azurerm
}

resource "azurerm_role_assignment" "main" {
  provider             = azurerm.azurerm
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.main.object_id
}

## Azure AD federated identity used to federate kubernetes with Azure AD
resource "azuread_application_federated_identity_credential" "github" {
  for_each              = var.github
  application_object_id = azuread_application.main.object_id
  display_name          = each.key
  description           = "The federated identity used to federate K8s with Azure AD with the app service running in k8s ${each.key}"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${each.value.repos}:${each.value.entity_type}"
}