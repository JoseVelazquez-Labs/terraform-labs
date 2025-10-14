# -----------------------------------------
# Outputs visibles tras terraform apply
# -----------------------------------------

output "resource_group_name" {
  description = "Nombre del Resource Group creado"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Nombre único de la Storage Account"
  value       = azurerm_storage_account.sa.name
}

output "storage_account_blob_endpoint" {
  description = "URL principal de los blobs"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}
