#Create Random ID
resource "random_id" "id" {
  byte_length = 4
}

# Create a resource group
resource "azurerm_resource_group" "afsal_app_rg" {
  name     = "${var.resource_group_name}-${random_id.id.hex}-RG"
  location = var.location
}

# Create public IP address
resource "azurerm_public_ip" "public-ip" {
  name                = "my-public-ip"
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
  allocation_method   = "Static"
  domain_name_label   = "${var.custom_dns_name}${random_id.id.hex}"
}


