 resource "azurerm_virtual_network" "test" {
   name                = "Vnet"
   address_space       = ["192.168.0.0/16"]
   location            = data.azurerm_resource_group.Hocine-Brief-12.location
   resource_group_name = data.azurerm_resource_group.Hocine-Brief-12.name
 }

 resource "azurerm_subnet" "test" {
   name                 = "SUBnet1"
   resource_group_name  = data.azurerm_resource_group.Hocine-Brief-12.name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = ["192.168.1.0/24"]
 }
 resource "azurerm_public_ip" "test" {
   name                         = "publicIPForLB"
   location                     = data.azurerm_resource_group.Hocine-Brief-12.location
   resource_group_name          = data.azurerm_resource_group.Hocine-Brief-12.name
   allocation_method            = "Static"
 }
 resource "azurerm_network_interface" "test" {
   count               = 2
   name                = "acctni${count.index}"
   location            = data.azurerm_resource_group.Hocine-Brief-12.location
   resource_group_name = data.azurerm_resource_group.Hocine-Brief-12.name

   ip_configuration {
     name                          = "testConfiguration"
     subnet_id                     = azurerm_subnet.test.id
     private_ip_address_allocation = "Dynamic"
   }
 }


