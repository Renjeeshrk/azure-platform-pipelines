variable "name" {
  type        = string
  description = "Name of the virtual network."
}

variable "location" {
  type        = string
  description = "Azure location for the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "Address spaces for the virtual network."
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS servers for the virtual network."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the virtual network."
  default     = {}
}
