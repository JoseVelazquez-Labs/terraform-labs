terraform {
  required_version = ">= 1.5.0"   # Versión mínima de Terraform necesaria
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"   # El proveedor es Microsoft Azure.
      version = "~> 3.100"            
    }
  }
}

provider "azurerm" {
  features {}   # Las características son una configuración obligatoria para Azure, pero se dejan vacías.
}

# Definición del Resource Group en Azure
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name   # Nombre del grupo de recursos (lo tomamos de variables.tf).
  location = var.location  # Región donde se creará. (lo tomamos de variables.tf).
  tags     = var.tags      # Etiquetas. (lo tomamos de variables.tf).
}
