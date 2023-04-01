# Create virtual machines
resource "azurerm_linux_virtual_machine" "vm-web" {
  name                = "web-vm"
  disable_password_authentication = false
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
  size                = "Standard_B1s"
  admin_username      = "admin"
  admin_password      = "Password1234!"

  network_interface_ids = [azurerm_network_interface.nic-web.id]

  os_disk {
    name              = "web-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_linux_virtual_machine.vm-web.public_ip_address
      user        = "admin"
      password    = "Password1234!"
      timeout     = "2m"
      agent       = false
    }
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo service nginx start"
    ]
  }
}

resource "azurerm_linux_virtual_machine" "vm-app" {
  name                = "app-vm"
  disable_password_authentication = false
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
  size                = "Standard_B1s"
  admin_username      = "admin"
  admin_password      = "Password1234!"

  network_interface_ids = [azurerm_network_interface.nic-app.id]

  os_disk {
    name              = "app-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # Install Nginx on startup
 custom_data = base64encode(<<EOF
                sudo apt-get update
                sudo apt-get install nginx
                EOF
                )
}

resource "azurerm_linux_virtual_machine" "vm-db" {
  name                = "db-vm"
  disable_password_authentication = false
  location            = azurerm_resource_group.afsal_app_rg.location
  resource_group_name = azurerm_resource_group.afsal_app_rg.name
  size                = "Standard_B1s"
  admin_username      = "admin"
  admin_password      = "Password1234!"

  network_interface_ids = [azurerm_network_interface.nic-db.id]

  os_disk {
    name              = "db-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}