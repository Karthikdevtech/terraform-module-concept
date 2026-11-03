provider "azurerm" {
  features {}
}

# 1. Call the Network Module
module "my_network" {
  source = "./modules/azure-vnet"

  resource_group_name = "rg-terraformmodule"
  location            = "eastus"
  vnet_address_space  = ["10.0.0.0/16"]
}

# 2. Call the VM Module, referencing resources from the network module
module "my_vm" {
  source = "./modules/azure-vm"

  vm_name             = "module-vm-01"
  location            = module.my_network.location
  resource_group_name = module.my_network.resource_group_name
  subnet_id           = module.my_network.subnet_id
}