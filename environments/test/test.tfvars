location = "Central India"

tags = {
  environment = "test"
  project     = "Project01"
}

platform_resource_group_name = "rg-pr-platform-network"
platform_vnet_name           = "vnet-pr-platform-hub"

spoke2_vnet_name          = "vnet-pr-test-spoke2"
spoke2_vnet_address_space = ["10.2.0.0/16"]
web_subnet_prefix         = ["10.2.2.0/24"]
data_subnet_prefix        = ["10.2.3.0/24"]

