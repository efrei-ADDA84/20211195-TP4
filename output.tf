output "resource_group_name"{
    value = var.resource_group
}

output "public_ip_address"{
    value = azurerm_linux_virtual_machine.devops-20211195.public_ip_address
}

output "tls_private_key"{
    value = tls_private_key.ssh_key.private_key_pem
    sensitive = true
}