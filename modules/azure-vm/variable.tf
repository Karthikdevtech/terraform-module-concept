variable "vm_count" {
  type        = number
  description = "Number of virtual machines to create"
  default     = 2
}

variable "vm_name_prefix" {
  type        = string
  description = "Prefix name for the virtual machines"
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