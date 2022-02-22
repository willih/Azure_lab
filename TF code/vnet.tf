# We strongly recommend using the required_providers block to set the

# Azure Provider source and version being used

terraform {

  required_version = ">= 1.0"

  required_providers {

    azurerm = {

      source  = "hashicorp/azurerm"

      version = "2.54.0"

    }

  }

}
# Configure the Microsoft Azure Provider

provider "azurerm" {

  features {}

}
resource "azurerm_resource_group" "example" {
  name     = "rgp-cus-hwtest"
  location = "Central US"
}

resource "azurerm_network_security_group" "example" {
  name                = "nsg-test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "vNet1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.101.1.0/16"]
  /* dns_servers         = ["10.101.0.4", "10.0.0.5"] */

  subnet {
    name           = "subnet1"
    address_prefix = "10.101.1.0/24"
  }

  /* subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  } */

  tags = {
    environment = "Dev"
  }
}