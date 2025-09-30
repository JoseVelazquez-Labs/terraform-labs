variable "rg_name" {
  description = "Nombre del Resource Group"
  type        = string
  default     = "rg-lab-terraform"
}

variable "location" {
  description = "Región de Azure"
  type        = string
  default     = "westeurope"
}

variable "tags" {
  description = "Etiquetas comunes"
  type        = map(string)
  default = {
    owner = "JoseVelazquez"
    env   = "lab"
  }
}
