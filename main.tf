data "azurerm_virtual_network" "network-tp4" {
  name                = var.network
  resource_group_name = var.resource_group
}

data "azurerm_subnet" "internal" {
    name = var.subnet
    virtual_network_name = data.azurerm_virtual_network.network-tp4.name
    resource_group_name = var.resource_group
}

resource "azurerm_public_ip" "charles_ip"{
    name = "charles_ip"
    location = var.location
    resource_group_name = var.resource_group
    allocation_method = "Static"
}

resource "azurerm_network_interface" "charles_NIC" {
    name = "charles_NIC"
    location = var.location
    resource_group_name = var.resource_group

    ip_configuration {
        name = "charles_NIC_config"
        subnet_id = data.azurerm_subnet.internal.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.charles_ip.id
    }
}

resource "tls_private_key" "ssh_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "azurerm_linux_virtual_machine" "devops-20211195"{
  name                  = var.vm_name 
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.charles_NIC.id]
  size                  = var.vm_size
  admin_username        = var.user_admin

  os_disk {
    name                 = "charles_disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.os
    version   = "latest"
  }


  admin_ssh_key {
    username   = var.user_admin
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  tags = {
    environment = "staging"
  }
}

