output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the created Virtual Network"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "The Azure region of the resource group"
}

output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The ID of the subnet"
}