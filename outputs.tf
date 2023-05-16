output "resource_group_name" {
  value = data.azurerm_resource_group.Hocine-Brief-12.name
}

output "public_ip_address" {
  value = azurerm_public_ip.test.ip_address
}

output "location" {
  value = data.azurerm_resource_group.Hocine-Brief-12.location
}
output "ip_privées" {
  value = azurerm_network_interface.test.*.private_ip_address
}

