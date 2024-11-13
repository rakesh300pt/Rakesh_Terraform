provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "rakeshpostsqlrg"
  location = "Central US"
}
resource "azurerm_postgresql_flexible_server" "rakesh_server" {
  name                   = "rakeshserver"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = "citus"
  administrator_password = "1qwerty7u*"
  version                = "16"
  sku_name               = "GP_Standard_D2s_v3"
  storage_mb             = 32768

  public_network_access_enabled = true
  tags = {
    Environment = "testing"
  }
}


resource "azurerm_postgresql_flexible_server_database" "postgracedatabase" {
  name      = "postgracedb"
  server_id = azurerm_postgresql_flexible_server.rakesh_server.id
}
