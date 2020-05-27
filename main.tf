###
# Storage account
###

module "storage_account" {
  source = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-storage-account.git?ref=1.0.0"

  enabled                   = var.enabled && var.storage_account_exist == false
  storage_account_name      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.resource_group_location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  storage_containers = var.storage_containers
  storage_shares     = var.storage_shares

  tags = merge(
    var.tags,
    var.storage_account_tags
  )
}

###
# Log analytics workspace
###

module "log_analytics_workspace" {
  source = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-log-analytics-workspace.git?ref=1.0.0"

  enabled             = var.enabled && var.workspace_exist == false
  name                = var.log_analytics_workspace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.workspace_sku
  retention_in_days   = var.retention_in_days
  tags = merge(
    var.tags,
    var.log_analytics_workspace_tags
  )
}



###
# Diagnostics settings
###

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.enabled ? var.diagnostics_count : 0

  name                       = element(var.names, count.index)
  target_resource_id         = element(var.target_resource_ids, count.index)
  log_analytics_workspace_id = var.workspace_exist != false ? data.azurerm_log_analytics_workspace.this[0].id : module.log_analytics_workspace.id
  storage_account_id         = var.storage_account_exist != false ? data.azurerm_storage_account.this[0].id : module.storage_account.id

  dynamic "log" {
    for_each = var.logs[count.index]

    content {
      category = lookup(log.value, "category", null)
      enabled  = lookup(log.value, "enabled", true)

      dynamic "retention_policy" {
        for_each = log.value.retention_policy

        content {
          enabled = retention_policy.value.enabled
          days    = retention_policy.value.days
        }
      }
    }
  }

  dynamic "metric" {
    for_each = var.metrics[count.index]

    content {
      category = lookup(metric.value, "category", null)
      enabled  = lookup(metric.value, "enabled", true)

      dynamic "retention_policy" {
        for_each = metric.value.retention_policy

        content {
          enabled = retention_policy.value.enabled
          days    = retention_policy.value.days
        }
      }
    }
  }
}
