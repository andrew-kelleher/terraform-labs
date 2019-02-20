# Create core resource group
resource "azurerm_resource_group" "core" {
   name         = "core"
   location     = "${var.loc}"
   tags         = "${var.tags}"
}

resource "azurerm_public_ip" "vpnGatewayPublicIp" {
  name                = "vpnGatewayPublicIp"
  location            = "${var.loc}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  allocation_method   = "Dynamic"
  tags                = "${var.tags}"
}

resource "azurerm_virtual_network" "core-vnet" {
  name                = "core-vnet"
  location            = "${azurerm_resource_group.core.location}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  tags                = "${var.tags}"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]
}
# recreate subnets as separate resources
  resource "azurerm_subnet" "GatewaySubnet" {
    name           = "GatewaySubnet"
    resource_group_name = "${azurerm_resource_group.core.name}"
    virtual_network_name = "${azurerm_virtual_network.core-vnet.name}"

    address_prefix = "10.0.0.0/24"
  }

  resource "azurerm_subnet" "training" {
    name           = "training"
    resource_group_name = "${azurerm_resource_group.core.name}"
    virtual_network_name = "${azurerm_virtual_network.core-vnet.name}"

    address_prefix = "10.0.1.0/24"
  }

  resource "azurerm_subnet" "dev" {
    name           = "dev"
    resource_group_name = "${azurerm_resource_group.core.name}"
    virtual_network_name = "${azurerm_virtual_network.core-vnet.name}"

    address_prefix = "10.0.2.0/24"
  }

/*
resource "azurerm_virtual_network_gateway" "vpnGateway" {
  name                = "vpnGateway"
  location            = "${azurerm_resource_group.core.location}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  tags                = "${var.tags}"

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.vpnGatewayPublicIp.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.GatewaySubnet.id}"
  }
}
*/