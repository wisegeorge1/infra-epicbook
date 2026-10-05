variable "resource_group_name" {
  type    = string
  default = "rg-epicbook-prod"
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "ssh_public_key" {
  type = string
}

variable "db_admin_username" {
  type    = string
  default = "epicbookadmin"
}

variable "db_admin_password" {
  type      = string
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "epicbookdb"
}
