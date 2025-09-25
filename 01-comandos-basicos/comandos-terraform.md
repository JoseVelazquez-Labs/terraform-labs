# 📘 Comandos básicos de Terraform

Listado completo de comandos de Terraform en un único bloque de código con explicación incluida.

```bash
# 🔹 Comandos de ayuda
terraform -help                          # Muestra ayuda general
terraform <comando> -help                # Muestra ayuda sobre un comando específico

# 🔹 Mostrar versión
terraform -version                       # Muestra la versión instalada de Terraform

# 🔹 Inicialización del directorio de trabajo
terraform init                           # Inicia el directorio y descarga proveedores
terraform init -get-plugins=false        # Inicia el directorio sin descargar proveedores
terraform init -verify-plugins=false     # Inicia sin verificar plugins con firma HashiCorp

# 🔹 Comandos get
terraform get                            # Descarga y actualiza módulos del módulo raíz
terraform get -update=true               # Revisa y actualiza módulos ya descargados

# 🔹 Aprovisionamiento de infraestructura
terraform plan                           # Crea un plan de ejecución
terraform plan -destroy                  # Muestra un plan de destrucción
terraform apply                          # Aplica cambios en el entorno real
terraform apply -target=<recurso>        # Aplica cambios solo en un recurso específico
terraform destroy -target=<recurso>      # Destruye solo un recurso y dependencias
terraform refresh                        # Reconcilia estado local con el real
terraform providers                      # Muestra información de los proveedores actuales

# 🔹 Workspaces
terraform workspace new <nombre>         # Crea un nuevo espacio de trabajo y lo selecciona
terraform workspace select <nombre>      # Selecciona un workspace existente
terraform workspace list                 # Lista todos los workspaces
terraform workspace show                 # Muestra el workspace actual
terraform workspace delete <nombre>      # Elimina un workspace vacío

# 🔹 Formato y validación
terraform fmt                            # Da formato al código HCL
terraform validate                       # Valida la sintaxis de los archivos

# 🔹 Inspección de infraestructura
terraform graph                          # Genera un gráfico con dependencias de recursos
terraform output                         # Lista todas las salidas del módulo raíz
terraform output instance_public_ip      # Muestra una salida específica
terraform output -json                   # Lista salidas en formato JSON
terraform show                           # Muestra el estado en formato legible

# 🔹 Importación de recursos
terraform import aws_instance.foo i-abcd1234   # Importa una instancia existente a Terraform

# 🔹 Manipulación de estado
terraform state list                     # Lista todos los recursos en el estado
terraform state list aws_instance.my_ec2 # Lista solo el recurso especificado
terraform state rm <recurso>             # Elimina un recurso del archivo de estado
terraform state pull                     # Extrae el estado actual y lo muestra
terraform state push <archivo.tfstate>   # Sube un archivo de estado local al remoto
terraform state show aws_instance.my_ec2 # Muestra atributos de un recurso en el estado

# 🔹 Otros comandos
echo "1+5" | terraform console           # Evalúa expresiones dentro de la consola
terraform taint aws_instance.my_ec2      # Marca un recurso como "dañado" para recrearlo
terraform untaint aws_instance.my_ec2    # Desmarca un recurso marcado como tainted
terraform force-unlock <LOCK_ID>         # Elimina el bloqueo de estado
terraform login                          # Obtiene token de API para Terraform Cloud
terraform logout                         # Elimina credenciales almacenadas de login

