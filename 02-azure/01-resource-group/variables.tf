# Nombre del Resource Group
variable "rg_name" {
  description = "Nombre del Resource Group"   
  type        = string                        # Tipo de dato: texto.
  default     = "rg-lab-terraform"            # Valor por defecto (puedes cambiarlo).
}

# Región donde desplegar los recursos.
variable "location" {
  description = "Región de Azure"             # Ejemplo: westeurope, northeurope, etc.
  type        = string
  default     = "westeurope"                  # Valor por defecto (Europa Oeste)
}

# Etiquetas para aplicar al grupo de recursos. (clave → valor)
variable "tags" {
  description = "Etiquetas comunes"
  type        = map(string)                   # Tipo: mapa de pares clave-valor
  default = {
    owner = "JoseVelazquez"                   # Quién creó el recurso
    env   = "lab"                             # Entorno (lab, dev, prod)
  }
}
