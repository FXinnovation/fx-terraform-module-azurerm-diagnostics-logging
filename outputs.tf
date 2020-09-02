###
# Diagnostic setting
###

output "id" {
  description = "ID of the diagnostics setting."
  value       = element(concat(azurerm_monitor_diagnostic_setting.this.*.id, list("")), 0)
}

###
# Storage account
###

output "storage_account_id" {
  description = "The ID of the storage account."
  value       = var.export_to_sa != false ? module.storage_account.id : null
}

###
# Log analytics workspace
###

output "log_analytics_primary_shared_key" {
  sensitive = true
  value     = var.export_to_law != false ? module.log_analytics_workspace.primary_shared_key : null
}

output "log_analytics_secondary_shared_key" {
  sensitive = true
  value     = var.export_to_law != false ? module.log_analytics_workspace.secondary_shared_key : null
}

output "log_analytics_workspace_id" {
  value = var.export_to_law != false ? module.log_analytics_workspace.workspace_id : null
}
