terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

# Leemos el Resource Group existente (del Lab 01)
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

# Sufijo aleatorio para cumplir unicidad del nombre
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Storage Account (nombres: 3-24, minúsculas, sin guiones)
resource "azurerm_storage_account" "sa" {
  name                     = lower(replace("${var.sa_prefix}${random_string.suffix.result}", "/[^a-z0-9]/", ""))
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_blob_public_access = false
  min_tls_version          = "TLS1_2"

  tags = var.tags
}

# Contenedor Blob
resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
