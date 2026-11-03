output "resource_group_name" {
  value       = module.my_network.resource_group_name
  description = "The name of the provisioned resource group"
}

output "vnet_id" {
  value       = module.my_network.vnet_id
  description = "The ID of the Virtual Network"
}

output "vm_public_ip" {
  value       = module.my_vm.vm_public_ip
  description = "The public IP address of the Linux VM"
}