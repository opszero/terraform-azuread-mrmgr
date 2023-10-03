output "client_id" {
  value = join("", azuread_service_principal.main.*.id)
}

output "app_id" {
  value = join("", azuread_service_principal.main.*.application_id)
}
