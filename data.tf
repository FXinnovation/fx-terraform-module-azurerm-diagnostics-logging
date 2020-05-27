data "azurerm_storage_account" "this" {
  count = var.enabled && var.storage_account_exist != false ? 1 : 0

  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "this" {
  count = var.enabled && var.workspace_exist != false ? 1 : 0

  name                = var.log_analytics_workspace_name
  resource_group_name = var.resource_group_name
}
