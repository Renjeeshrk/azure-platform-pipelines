
# Resource group for shared platform network resources.

resource "azurerm_resource_group" "platform_network" {
  name     = "rg-pr-platform-network"
  location = var.location
  tags     = var.tags
}


# Deploy Hub Virtual Network and its subnets

module "hub_vnet" {
  source              = "../../modules/virtual-network"
  name                = var.hub_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.platform_network.name
  address_space       = var.hub_vnet_address_space
  tags                = var.tags
}

module "hub_gateway_subnet" {
  source               = "../../modules/subnets"
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.platform_network.name
  virtual_network_name = module.hub_vnet.name
  address_prefixes     = var.gateway_subnet_prefix
}

module "hub_firewall_subnet" {
  source               = "../../modules/subnets"
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.platform_network.name
  virtual_network_name = module.hub_vnet.name
  address_prefixes     = var.azure_firewall_subnet_prefix
}

module "hub_awaf_subnet" {
  source               = "../../modules/subnets"
  name                 = "AWAFSubnet"
  resource_group_name  = azurerm_resource_group.platform_network.name
  virtual_network_name = module.hub_vnet.name
  address_prefixes     = var.awaf_subnet_prefix
}

