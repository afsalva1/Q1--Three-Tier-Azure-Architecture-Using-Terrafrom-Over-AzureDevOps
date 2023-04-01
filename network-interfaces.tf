# Create network interfaces
resource "azurerm_network_interface" "nic-web" {
  name                = "web-nic"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet-web-layer.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
}

resource "azurerm_network_interface" "nic-app" {
  name                = "app-nic"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet-app-layer.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic-db" {
  name                = "db-nic"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet-db-layer.id
    private_ip_address_allocation = "Dynamic"
  }
}