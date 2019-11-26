output "diagnostics_map" {
  value = map(
    "diags_sa", azurerm_storage_account.this.id,
    "eh_name", azurerm_eventhub_namespace.this.name,
    "eh_id", azurerm_eventhub_namespace.this.id,
    "la_name", var.log_analytics_workspace_name,
    "la_id", module.log-analytics-workspace.id,
    "la_work_id", module.log-analytics-workspace.workspace_id
  )
}

output "log_analytics_primary_shared_key" {
  sensitive = true
  value     = module.log-analytics-workspace.primary_shared_key
}

output "log_analytics_secondary_shared_key" {
  sensitive = true
  value     = module.log-analytics-workspace.secondary_shared_key
}

output "log_analytics_workspace_id" {
  value = module.log-analytics-workspace.workspace_id
}
