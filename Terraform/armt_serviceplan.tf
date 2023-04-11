resource "azurerm_app_service_plan" "bootcampsp" {
  name                = "bootcampsp"
  location            = "East US"
  kind                = "linux"
  reserved            = true
  sku {
    tier = "Free"
    size = "F1"
  }
  properties {
    name             = "bootcampsp"
    worker_size      = "0"
    worker_size_id   = "0"
    number_of_workers= "1"
    zone_redundant   = false
  }
}