# Create a virtual network
resource "azurerm_virtual_network" "afsal_app_vnet" {
  name                = "my-afsal_app_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
}

# Create subnets
resource "azurerm_subnet" "subnet-web-layer" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.afsal_app_rg.name
  virtual_network_name = azurerm_virtual_network.afsal_app_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet-app-layer" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.afsal_app_rg.name
  virtual_network_name = azurerm_virtual_network.afsal_app_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet-db-layer" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.afsal_app_rg.name
  virtual_network_name = azurerm_virtual_network.afsal_app_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}