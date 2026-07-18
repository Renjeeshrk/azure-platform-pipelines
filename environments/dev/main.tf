# Deploy the Resource groups for Spoke 1 prod network, monitoring and security

resource "azurerm_resource_group" "spoke1_prod_network" {
  name     = "rg-pr-dev-network"
  location = var.location
  tags     = var.tags
}



# Create Spoke 1 prod virtual network and subnets

module "spoke1_prod_vnet" {
  source              = "../../modules/virtual-network"
  name                = var.spoke1_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.spoke1_prod_network.name
  address_space       = var.spoke1_vnet_address_space
  tags                = var.tags
}

module "spoke1_prod_web_subnet" {
  source               = "../../modules/subnets"
  name                 = "WebSubnet"
  resource_group_name  = azurerm_resource_group.spoke1_prod_network.name
  virtual_network_name = module.spoke1_prod_vnet.name
  address_prefixes     = var.web_subnet_prefix
}

module "spoke1_prod_data_subnet" {
  source               = "../../modules/subnets"
  name                 = "DataSubnet"
  resource_group_name  = azurerm_resource_group.spoke1_prod_network.name
  virtual_network_name = module.spoke1_prod_vnet.name
  address_prefixes     = var.data_subnet_prefix
}

# Creaste Peering bettwen Spoke1 and Platform Hub

resource "azurerm_virtual_network_peering" "spoke1_to_platform" {
  name                      = "spoke1-prod-to-platform"
  resource_group_name       = azurerm_resource_group.spoke1_prod_network.name
  virtual_network_name      = module.spoke1_prod_vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.platform_hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "platform_to_spoke1" {
  name                      = "platform-to-spoke1-prod"
  resource_group_name       = data.azurerm_resource_group.platform.name
  virtual_network_name      = data.azurerm_virtual_network.platform_hub.name
  remote_virtual_network_id = module.spoke1_prod_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}
