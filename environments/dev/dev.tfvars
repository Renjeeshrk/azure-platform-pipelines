location = "Central India"


tags = {
  environment = "dev"
  project     = "Project01"
}

platform_resource_group_name = "rg-pr-platform-network"
platform_vnet_name           = "vnet-pr-platform-hub"

spoke1_vnet_name          = "vnet-pr-dev-spoke1"
spoke1_vnet_address_space = ["10.1.0.0/16"]
web_subnet_prefix         = ["10.1.1.0/24"]
data_subnet_prefix        = ["10.1.2.0/24"]


