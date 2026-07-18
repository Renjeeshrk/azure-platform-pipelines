output "id" {
  value       = azurerm_virtual_network.this.id
  description = "The ID of the virtual network."
}

output "name" {
  value       = azurerm_virtual_network.this.name
  description = "The name of the virtual network."
}

output "address_space" {
  value       = azurerm_virtual_network.this.address_space
  description = "The address spaces assigned to the virtual network."
}
