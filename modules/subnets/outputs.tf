output "id" {
  value       = azurerm_subnet.this.id
  description = "The ID of the subnet."
}

output "name" {
  value       = azurerm_subnet.this.name
  description = "The name of the subnet."
}

output "address_prefixes" {
  value       = azurerm_subnet.this.address_prefixes
  description = "The address prefixes assigned to the subnet."
}
