# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "euspocsa1"
    resource_group_name  = "RG-Terraform-POC"                      
    container_name       = "terraform-state"                      
    key                  = "prod.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

locals {
  common_tags = {
    Owner   = "prashanth18400@gmail.com"
    createdFrom = "Terraform"
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rgName
  location = var.location
  tags = local.common_tags
}
