variable "webAppName" {
  description = "Nombre del appservice"
  default     = "webApp-${random_string.resource_group.id.result}"
}

variable "location" {
  description = "Ubicacion"
  default     = "East US"
}

variable "sku" {
  description = "SKU gratuito"
  default     = "F1"
}

variable "linuxFxVersion" {
  description = "stack por defecto"
  default     = "DOTNETCORE|3.0"
}

variable "repoUrl" {
  description = "GIT repo del serviceplan"
  default     = ""
}

locals {
  appServicePlanPortalName = "bootcampsp"
}

resource "random_string" "resource_group" {
  length  = 2
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = var.webAppName
  location = var.location
}

resource "azurerm_app_service_plan" "example" {
  name                = local.appServicePlanPortalName
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "linux"

  sku {
    tier = var.sku
    size = var.sku
  }

  reserved = true
}

resource "azurerm_app_service" "appservice1bootcampacs" {
  name                = "appservice1bootcampacs"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version   = var.linuxFxVersion
    min_tls_version    = "1.2"
    ftps_state         = "FtpsOnly"
    always_on          = true
    use_32_bit_worker_process = false
    http2_enabled      = true
    websockets_enabled = true
    scm_type           = "LocalGit"
    cors {
      allowed_origins     = ["*"]
      support_credentials = false
    }
    ip_restriction {
      action       = "Allow"
      ip_address   = "*.*.*.*"
      priority     = 100
      name         = "Allow All"
      service_tag  = ""
      virtual_network_subnet_id   =""
    }
    auto_swap_slot_name         ="production"
    default_documents           =[ ]
    detailed_error_logging_enabled=true
    document_root               ="site\\wwwroot\\"
    http_logging_enabled        ="true"
    logs_directory_size_limit   ="35"
    managed_pipeline_mode       ="Integrated"
    remote_debugging_enabled    ="false"
    remote_debugging_version    ="VS2019"

identity {
type= "SystemAssigned"
}
}
}

resource "azurerm_app_service" "appservice2bootcampacs" {
name= "appservice2bootcampacs"
location= azurerm_resource_group.example.location
resource_group_name= azurerm_resource_group.example.name
app_service_plan_id= azurerm_app_service_plan.example.id

site_config {
linux_fx_version= var.linuxFxVersion
min_tls_version= "1.2"
ftps_state= "FtpsOnly"
always_on= true
use_32_bit_worker_process= false
http2_enabled= true
websockets_enabled= true
scm_type= "LocalGit"
cors {
allowed_origins= ["*"]
support_credentials= false
}
ip_restriction {
action= "Allow"
ip_address= "*.*.*.*"
priority=100 
name="Allow All"
service_tag=""
virtual_network_subnet_id=""
}
auto_swap_slot_name="production"
default_documents=[]
detailed_error_logging_enabled=true 
document_root="site\\wwwroot\\" 
http_logging_enabled="true" 
logs_directory_size_limit="35" 
managed_pipeline_mode="Integrated" 
remote_debugging_enabled="false" 
remote_debugging_version="VS2019"

identity{
type="SystemAssigned"
}
}
}