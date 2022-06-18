provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "v-netRG" {
  name     = "ProjectRG"
  location = "South India"
    }

resource "azurerm_virtual_network" "example" {
  name                = "Project-Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.v-netRG.location
  resource_group_name = azurerm_resource_group.v-netRG.name
}

resource "azurerm_subnet" "MasterSubnet" {
  name                 = "Subnet1"
  resource_group_name  = azurerm_resource_group.v-netRG.name
  virtual_network_name = azurerm_virtual_network.example.name	
  address_prefixes     = ["10.0.1.0/24"]
}
