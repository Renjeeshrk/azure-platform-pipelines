terraform {
  backend "azurerm" {
    resource_group_name  = "rg-XX-tfstate"
    storage_account_name = "XX"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}