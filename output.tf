output "client_id" {
  value = { for k, v in azuread_service_principal.main : k => v.id }
}

output "app_id" {
  value = { for k, v in azuread_service_principal.main : k => v.application_id }
}
