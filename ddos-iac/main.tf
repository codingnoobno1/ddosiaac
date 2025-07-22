terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "cloud" {
  source              = "./cloud_infra"
  resource_group_name = "ddos-rg"
  location            = "East US"
  vnet_name           = "ddos-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_names        = ["web", "monitoring", "attacker"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
