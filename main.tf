data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

locals {
  location = var.location == "" ? data.azurerm_resource_group.rg.location : var.location
}

#Defines the subscription-wide logging and eventing settings
#Creating the containers on Storage Account and Event Hub (optional)

resource "azurerm_storage_account" "this" {
  count                     = var.enabled ? 1 : 0
  location                  = local.location
  resource_group_name       = data.azurerm_resource_group.rg.name
  name                      = var.storage_account_name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}

resource "azurerm_eventhub_namespace" "this" {
  count                = var.enabled ? 1 : 0
  location             = local.location
  resource_group_name  = data.azurerm_resource_group.rg.name
  name                 = var.event_hub_namespace_name
  sku                  = "Standard"
  capacity             = 2
  auto_inflate_enabled = false
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}

resource "azurerm_monitor_log_profile" "subscription" {
  count = var.enabled ? 1 : 0
  name  = "default"

  categories = [
    "Action",
    "Delete",
    "Write"
  ]

  # Add all regions - > put in variable
  # az account list-locations --query '[].name'
  # updated Nov 08 2019
  locations = [
    "global",
    "eastasia",
    "southeastasia",
    "centralus",
    "eastus",
    "eastus2",
    "westus",
    "northcentralus",
    "southcentralus",
    "northeurope",
    "westeurope",
    "japanwest",
    "japaneast",
    "brazilsouth",
    "australiaeast",
    "australiasoutheast",
    "southindia",
    "centralindia",
    "westindia",
    "canadacentral",
    "canadaeast",
    "uksouth",
    "ukwest",
    "westcentralus",
    "westus2",
    "koreacentral",
    "koreasouth",
    "francecentral",
    "francesouth",
    "australiacentral",
    "australiacentral2",
    "uaecentral",
    "uaenorth",
    "southafricanorth",
    "southafricawest",
    "switzerlandnorth",
    "switzerlandwest",
    "germanynorth",
    "germanywestcentral",
    "norwaywest",
    "norwayeast"
  ]

  # RootManageSharedAccessKey is created by default with listen, send, manage permissions
  servicebus_rule_id = "${azurerm_eventhub_namespace.this[0].id}/authorizationrules/RootManageSharedAccessKey"
  storage_account_id = azurerm_storage_account.this[0].id

  retention_policy {
    enabled = true
    days    = var.subscription_logs_retention
  }
}

module "log-analytics-workspace" {
  source              = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-log-analytics-workspace.git?ref=0.2.0"
  enabled             = var.enabled ? true : false
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  name                = var.log_analytics_workspace_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_in_days
  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}
