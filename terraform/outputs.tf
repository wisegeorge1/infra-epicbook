output "vm_public_ip" {
  description = "Public IP address of the Web VM"
  value       = module.compute.public_ip
}

output "mysql_server_fqdn" {
  description = "FQDN of the Azure MySQL Flexible Server"
  value       = module.database.fqdn
}
