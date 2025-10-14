# -----------------------------------------
# Variables globales del proyecto
# -----------------------------------------

variable "rg_name" {
  description = "Nombre del Resource Group donde se creará la Storage Account"
  type        = string
  default     = "rg-terraform-lab"
}

variable "location" {
  description = "Región de Azure donde desplegar los recursos"
  type        = string
  default     = "westeurope"
}

variable "sa_prefix" {
  description = "Prefijo para el nombre de la Storage Account (solo minúsculas y números)"
  type        = string
  default     = "stglab"
}
