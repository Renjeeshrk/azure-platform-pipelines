resource "azurerm_resource_group" "Spoke2_test_network" {
  name     = "rg-pr-test-network"
  location = var.location
  tags     = var.tags
}


module "spoke2_vnet" {
  source              = "../../modules/virtual-network"
  name                = var.spoke2_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.Spoke2_test_network.name
  address_space       = var.spoke2_vnet_address_space
  tags                = var.tags
}

module "spoke2_web_subnet" {
  source               = "../../modules/subnets"
  name                 = "WebSubnet"
  resource_group_name  = azurerm_resource_group.Spoke2_test_network.name
  virtual_network_name = module.spoke2_vnet.name
  address_prefixes     = var.web_subnet_prefix
}

module "spoke2_data_subnet" {
  source               = "../../modules/subnets"
  name                 = "DataSubnet"
  resource_group_name  = azurerm_resource_group.Spoke2_test_network.name
  virtual_network_name = module.spoke2_vnet.name
  address_prefixes     = var.data_subnet_prefix
}



resource "azurerm_virtual_network_peering" "spoke_to_platform" {
  name                      = "spoke2-to-platform"
  resource_group_name       = azurerm_resource_group.Spoke2_test_network.name
  virtual_network_name      = module.spoke2_vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.platform_hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "platform_to_spoke" {
  name                      = "platform-to-spoke2"
  resource_group_name       = data.azurerm_resource_group.platform.name
  virtual_network_name      = data.azurerm_virtual_network.platform_hub.name
  remote_virtual_network_id = module.spoke2_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}
