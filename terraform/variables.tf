variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region for resource deployment."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-epicbook-prod"
  description = "Resource group name."
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for virtual machines."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key string for VM access."
}

variable "admin_ip_address" {
  type        = string
  description = "Your public IP address for SSH management access (e.g. 102.89.0.1/32)."
}

variable "mysql_admin_username" {
  type        = string
  default     = "epicadmin"
  description = "Administrator login for MySQL Flexible Server."
}

variable "mysql_admin_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for MySQL Flexible Server."
}
