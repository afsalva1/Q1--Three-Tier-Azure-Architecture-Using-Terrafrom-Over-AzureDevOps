# Output the public IP address of the web VM
output "public_ip_address" {
  value = azurerm_public_ip.public-ip.ip_address
}
output "public_ip_fqdn" {
  value = azurerm_public_ip.public-ip.fqdn
}
