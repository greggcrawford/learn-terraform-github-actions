terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "terraformAzure1"

    workspaces {
      name = "demo-github-actions"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a virtual network
resource "azurerm_virtual_network" "vnetC1" {
  name                = "BatmanIncC"
  address_space       = ["10.0.0.0/16"]
  location            = "Central US"
  resource_group_name = "1-cb72c1bb-playground-sandbox"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "Batman"
  }
}

resource "azurerm_subnet" "subnetC1" {
  name                 = "subnetC1"
  resource_group_name  = "1-cb72c1bb-playground-sandbox"
  virtual_network_name = azurerm_virtual_network.vnetC1.name
  address_prefixes     = ["10.0.1.0/24"]
}

