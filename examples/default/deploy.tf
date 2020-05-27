resource "random_string" "this" {
  length  = 4
  upper   = false
  special = false
}

module "resource_group_demo" {
  source   = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=1.0.0"
  location = "francecentral"
  name     = "tftest${random_string.this.result}"

  tags = {
    managed_by = "Terraform"
    EndDate    = "2020-05-25"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "tftest${random_string.this.result}"
  address_space       = ["10.0.0.0/16"]
  location            = "francecentral"
  resource_group_name = module.resource_group_demo.name
}

resource "azurerm_subnet" "example" {
  name                 = "tftest${random_string.this.result}"
  resource_group_name  = module.resource_group_demo.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "tftest${random_string.this.result}"
  location            = module.resource_group_demo.location
  resource_group_name = module.resource_group_demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "tftest${random_string.this.result}"
  resource_group_name = module.resource_group_demo.name
  location            = module.resource_group_demo.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}


module "example" {
  source = "../.."

  resource_group_name       = module.resource_group_demo.name
  resource_group_location   = module.resource_group_demo.location
  storage_account_name      = "tftest${random_string.this.result}"
  account_tier              = "standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  log_analytics_workspace_name = "tftest${random_string.this.result}"
  workspace_sku                = "free"
  retention_in_days            = 1

  diagnostics_count   = 1
  names               = ["tftest${random_string.this.result}"]
  target_resource_ids = ["${azurerm_windows_virtual_machine.example.id}"]
  logs                = [[]]
  metrics = [
    [
      {
        category = "AllMetrics"
        enabled  = true

        retention_policy = [
          {
            enabled = false
            days    = 1
          }
        ]
      }
    ]
  ]
  log_analytics_destination_type = ["Dedicated"]
}
