output "platform_network_rg_id" {
  value       = azurerm_resource_group.platform_network.id
  description = "The ID of the platform network resource group."
}

output "platform_network_rg_name" {
  value       = azurerm_resource_group.platform_network.name
  description = "The name of the platform network resource group."
}


output "hub_vnet_name" {
  value       = module.hub_vnet.name
  description = "The name of the hub virtual network."
}

output "hub_vnet_id" {
  value       = module.hub_vnet.id
  description = "The ID of the hub virtual network."
}

