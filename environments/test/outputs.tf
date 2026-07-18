
output "spoke2_vnet_name" {
  value       = module.spoke2_vnet.name
  description = "The name of the test spoke2 virtual network."
}

output "spoke2_vnet_id" {
  value       = module.spoke2_vnet.id
  description = "The ID of the test spoke2 virtual network."
}

