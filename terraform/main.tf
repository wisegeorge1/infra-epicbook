terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-epicbook-tfstate"
    storage_account_name = "stepicbooktfstate20827"
    container_name       = "tfstate"
    key                  = "epicbook.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_cidr           = var.vnet_cidr
  web_subnet_cidr     = var.web_subnet_cidr
  db_subnet_cidr      = var.db_subnet_cidr
}

module "database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  db_subnet_id        = module.networking.db_subnet_id
  vnet_id             = module.networking.vnet_id
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
  db_name             = var.db_name
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  web_subnet_id       = module.networking.web_subnet_id
  ssh_public_key      = var.ssh_public_key
  vm_size             = var.vm_size
}
