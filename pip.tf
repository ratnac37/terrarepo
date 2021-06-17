provider "azurerm" {
  features {}
  version         = "=2.46.0"
  subscription_id = "34be2af6-ff5f-4da7-882e-ffebb0e6c093"
  client_id       = "9c794684-8443-419a-9a09-4ed706345fc7"
  client_secret   = "45IcyQcdvW_gk~U-U5~fC.2v0k~EbrS245"
  tenant_id       = "f5113046-dc7d-41ef-b131-4e71a948d273"
}

terraform {
  backend "azurerm" {
    storage_account_name = "testsacount"
    container_name       = "container1"
    key                  = "terraform.tfstate"
    access_key = "q4lizLPE8GaZduKUnZdqiiTDf+Hum4LjxCRglr4wzQQRtpkcThpj+KeuKmFVnFKeZg48OJb6FguMT325Pu6Q5g=="
  }
}

resource "azurerm_resource_group" "example" {
  name     = "despiprg"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "Pub100"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  tags = {
    environment = "Production"
  }
}

resource "azurerm_managed_disk" "example" {
  name                 = "disk10000"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "2"
}