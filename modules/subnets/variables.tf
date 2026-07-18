variable "name" {
  type        = string
  description = "Name of the subnet."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for the subnet."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network the subnet belongs to."
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet."
}

