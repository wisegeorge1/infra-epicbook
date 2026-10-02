required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80.0"
    }
  }
  backend "azurerm" {
    # Populated dynamically during terraform init in Azure DevOps pipeline
    resource_group_name  = "rg-epicbook-tfstate"
    storage_account_name = "epicbook-storage"
    container_name       = "tfstate"
    key                  = "epicbook.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
