resource "azurerm_resource_group" "resource_group" {
  name     = "rg-vm"
  location = var.location

  tags = local.common_tags

}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = local.common_tags

}

resource "azurerm_network_interface" "network_interface" {
  name                = "nic_terraform"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "public-ip-terraform"
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_id
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address            = "10.0.1.22"
  }

  tags = local.common_tags

}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.network.outputs.security_group
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-terraform"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  size                = "Standard_B1ms" # Corrigido para uma VM free-tier
  admin_username      = "azurerm"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id
  ]

  admin_ssh_key {
    username   = "azurerm"
    public_key = file("../AWS-EC2/files/aws-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}