variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name passed from the network module"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID passed from the network module"
}