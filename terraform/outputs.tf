output "app_public_ip" {
  value       = azurerm_public_ip.frontend_pip.ip_address
  description = "The frontend VM public IP used by browser users."
}

output "backend_ansible_host" {
  value       = azurerm_public_ip.backend_pip.ip_address
  description = "The management address used by Ansible to connect to the backend VM."
}

output "backend_private_ip" {
  value       = azurerm_network_interface.backend_nic.private_ip_address
  description = "The private address used by Nginx to reach the backend application."
}

output "mysql_fqdn" {
  value       = azurerm_mysql_flexible_server.mysql.fqdn
  description = "The private Azure Database for MySQL hostname."
}
