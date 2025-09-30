output "resource_group_id" {
  description = "ID del Resource Group creado"
  value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  description = "Nombre del Resource Group creado"
  value       = azurerm_resource_group.rg.name
}
