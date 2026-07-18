terraform {
  backend "azurerm" {
    resource_group_name  = "rg-project01-tfstate"
    storage_account_name = "sgproject01tfstate"
    container_name       = "tfstate"
    key                  = "platform.tfstate"
  }
}