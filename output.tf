output "clientid" {
  value = azuread_service_principal.main.id
}

output "app_id" {
  value = azuread_service_principal.main.application_id
}
