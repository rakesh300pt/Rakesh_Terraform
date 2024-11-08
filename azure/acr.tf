resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.rg_name
}

resource "azurerm_container_registry" "tfreg" {
  name                = "acrregistry007"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true
}

output "adminpwd" {
  value     = azurerm_container_registry.tfreg.admin_password
  sensitive = true
}

resource "azurerm_container_registry_token" "token" {
  name                    = "testtoken"
  container_registry_name = azurerm_container_registry.tfreg.name
  resource_group_name     = azurerm_resource_group.rg.name
  scope_map_id            = azurerm_container_registry_scope_map.scope.id
}

resource "azurerm_container_registry_scope_map" "scope" {
  name                    = "repopull"
  resource_group_name     = azurerm_resource_group.rg.name
  container_registry_name = azurerm_container_registry.tfreg.name

actions = [
    "repositories/repo1/content/read",
    "repositories/repo1/content/write"
  ]
}

resource "azurerm_container_registry_token_password" "pwd" {
  container_registry_token_id = azurerm_container_registry_token.token.id

  password1 {
    expiry = "2024-11-30T17:57:36+08:00"
  }
}
