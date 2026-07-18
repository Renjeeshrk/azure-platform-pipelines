data "azurerm_resource_group" "platform" {
  name = var.platform_resource_group_name
}

data "azurerm_virtual_network" "platform_hub" {
  name                = var.platform_vnet_name
  resource_group_name = data.azurerm_resource_group.platform.name
}
