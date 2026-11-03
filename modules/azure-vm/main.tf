# Create Public IP for remote access
resource "azurerm_public_ip" "pip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${format("%02d", count.index + 1)}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Create Network Interface and attach it to the Subnet
resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${format("%02d", count.index + 1)}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}

# Create the Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.vm_count
  name                            = "${var.vm_name_prefix}-${format("%02d", count.index + 1)}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_F1als_v7" # Cost-effective size for testing
  admin_username                  = "azureuser"
  admin_password                  = "P@ssw0rd1234!" # Use SSH keys in production
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic[count.index].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}