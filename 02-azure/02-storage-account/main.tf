# -----------------------------------------
# Terraform + provider de Azure (mínimo)
# -----------------------------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Cualquier 3.x estable
    }
    random = { # Genera valores aleatorios (nombres, contraseñas, etc.)
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}  # Requerido por el provider de Azure
}

# ------------------------------------------------
# Sufijo aleatorio para que el nombre sea único
# (la Storage Account exige unicidad global)
# ------------------------------------------------
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
  number  = true
}

# -----------------------------------------
# Resource Group (dónde vivirá la Storage)
# -----------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "rg-sa-minimo"
  location = "westeurope"
}

# ------------------------------------------------
# Storage Account mínima y segura por defecto
# - nombre en minúsculas + números, 3-24 chars
# - HTTPS only; replicación local (LRS)
# ------------------------------------------------
resource "azurerm_storage_account" "sa" {
  name                     = "stgmin${random_string.suffix.result}"   # p.ej. stgmin4f2k9a
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  enable_https_traffic_only = true
  allow_blob_public_access  = false
}
