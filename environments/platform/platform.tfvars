location = "Central India"

tags = {
  environment = "platform"
  project     = "Project01"
  scope       = "infra"
}

# Hub vNet Variables 

hub_vnet_name                = "vnet-pr-platform-hub"
hub_vnet_address_space       = ["10.0.0.0/16"]
gateway_subnet_prefix        = ["10.0.0.0/24"]
azure_firewall_subnet_prefix = ["10.0.1.0/24"]
awaf_subnet_prefix           = ["10.0.2.0/24"]

