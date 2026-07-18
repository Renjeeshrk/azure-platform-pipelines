variable "location" {
  type        = string
  description = "Azure location for platform resources."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the platform resource groups."

}

# Variables for the hub virtual network and its subnets

variable "hub_vnet_name" {
  type        = string
  description = "Name of the hub virtual network."

}

variable "hub_vnet_address_space" {
  type        = list(string)
  description = "Address space for the hub virtual network."

}

variable "gateway_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the GatewaySubnet."

}

variable "azure_firewall_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the AzureFirewallSubnet."

}

variable "awaf_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the AWAFSubnet."

}

