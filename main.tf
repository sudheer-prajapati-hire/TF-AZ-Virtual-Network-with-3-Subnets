provider "azurerm" {
  features {}
  subscription_id = "cce99f66-700b-46a4-a127-e577283a77cd"
}

# Existing Resource Group
resource "azurerm_resource_group" "dev_rg" {
  name     = "rg-dev-infra"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet_dev" {
  name                = "vnet-dev"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
}

# Subnet: default
resource "azurerm_subnet" "subnet_default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  address_prefixes     = ["10.0.0.0/24"]

  private_endpoint_network_policies = "Disabled"
  # private_link_service_network_policies is left out because default is Enabled
}

# Subnet: web
resource "azurerm_subnet" "subnet_web" {
  name                 = "subnet-web"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  address_prefixes     = ["10.0.1.0/24"]

  private_endpoint_network_policies = "Disabled"
}

# Subnet: db (underscore name as in ARM)
resource "azurerm_subnet" "subnet_db" {
  name                 = "subnet_db"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  address_prefixes     = ["10.0.2.0/24"]

  private_endpoint_network_policies = "Disabled"
}

