# Create network security groups
resource "azurerm_network_security_group" "nsg-web" {
  name                = "web-nsg"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
}

resource "azurerm_network_security_group" "nsg-app" {
  name                = "app-nsg"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
}

resource "azurerm_network_security_group" "nsg-db" {
  name                = "db-nsg"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
}
