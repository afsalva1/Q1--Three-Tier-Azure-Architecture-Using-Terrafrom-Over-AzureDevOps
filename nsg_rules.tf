# Create NSG rules
resource "azurerm_network_security_rule" "web-inbound" {
  name                        = "web-inbound-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = azurerm_subnet.subnet-web-layer.address_prefixes[0]
  resource_group_name         = azurerm_resource_group.afsal_app_rg.name
  network_security_group_name = azurerm_network_security_group.nsg-web.name
}

resource "azurerm_network_security_rule" "app-inbound" {
  name                        = "app-inbound-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = azurerm_subnet.subnet-web-layer.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.subnet-app-layer.address_prefixes[0]
  resource_group_name         = azurerm_resource_group.afsal_app_rg.name
  network_security_group_name = azurerm_network_security_group.nsg-app.name
}

resource "azurerm_network_security_rule" "db-inbound" {
  name                        = "db-inbound-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = azurerm_subnet.subnet-app-layer.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.subnet-db-layer.address_prefixes[0]
  resource_group_name         = azurerm_resource_group.afsal_app_rg.name
  network_security_group_name = azurerm_network_security_group.nsg-db.name
}