
variable "location" {
  type        = string
  description = "Azure location for production resources."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the production resources."
  default     = {}
}

variable "platform_resource_group_name" {
  type        = string
  description = "Name of the existing platform network resource group."
}

variable "platform_vnet_name" {
  type        = string
  description = "Name of the existing platform hub virtual network."
}

variable "spoke1_vnet_name" {
  type        = string
  description = "Name of the production spoke virtual network."

}

variable "spoke1_vnet_address_space" {
  type        = list(string)
  description = "Address space for the production spoke virtual network."

}

variable "web_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the WebSubnet."

}

variable "data_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the DataSubnet."

}
