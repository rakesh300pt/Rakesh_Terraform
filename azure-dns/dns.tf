resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "test1" {
  name                = var.test1_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.1.0/24"]
  location            = var.location
}

resource "azurerm_virtual_network" "test2" {
  name                = var.test2_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.2.0/24"]
  location            = var.location
}

resource "azurerm_virtual_network_peering" "vnet1" {
  name                      = var.vnet1_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.test1.name
  remote_virtual_network_id = azurerm_virtual_network.test2.id
}

resource "azurerm_virtual_network_peering" "vnet2" {
  name                      = var.vnet2_name
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.test2.name
  remote_virtual_network_id = azurerm_virtual_network.test1.id
}
resource "azurerm_private_dns_zone" "demo" {
  name                = "mydomain.com"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_private_dns_zone_virtual_network_link" "network" {
  name                  = var.network_name
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.demo.name
  virtual_network_id    = azurerm_virtual_network.test1.id
  registration_enabled  = true
}

