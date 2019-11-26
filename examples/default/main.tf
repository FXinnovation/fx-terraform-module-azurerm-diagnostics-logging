module "az-rg-demo" {
  source   = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=0.2.0"
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

module "az-diagnostics-demo" {
  source                       = "../../"
  resource_group_name          = module.az-rg-demo.name
  storage_account_name         = var.storage_account_name
  event_hub_namespace_name     = var.event_hub_namespace_name
  subscription_logs_retention  = var.subscription_logs_retention
  log_analytics_workspace_name = var.log_analytics_workspace_name
}
