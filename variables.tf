###
# General
###
variable "enabled" {
  description = "Enable or disable module."
  default     = true
}

variable "resource_group_location" {
  description = "Location where the resources will be deployed.Changing this forces a new resource to be created."
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Name of the resource group where the resource will be deployed.Changing this forces a new resource to be created."
  default     = ""
}

variable "tags" {
  description = "Tags shared by all resource of this module. Will be merged with any other specific tags by resource."
  default     = {}
}

###
# Storage account
###

variable "storage_account_exist" {
  description = "Boolean flag which describes whether the storage account is already existing or not."
  default     = false
}

variable "storage_account_name" {
  description = "Name of the storage account to be used to host the logs. Changing forces a new resource to be created."
  type        = string
  default     = ""
}

variable "account_tier" {
  description = "Type of the tier to use for the storage account.Changing this force a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The type of replication to use for this storage account. Valid options are 'LRS','GRS','RAGRS' and 'ZRS'."
  type        = string
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled."
  default     = true
}

variable "storage_containers" {
  description = "List of containers to create and their access levels."
  default     = []
  type        = list(object({ name = string, access_type = string }))
}

variable "storage_shares" {
  description = "List of share to create"
  default     = []
  type        = list(object({ name = string, quota = string }))
}

variable "storage_account_tags" {
  description = "Tags which will be specifically assigned to the storage account."
  default     = {}
}

###
# Log analytics workspace
###

variable "workspace_exist" {
  description = "Boolean flag which describes whether the log analytics workspace is already existing or not."
  default     = false
}

variable "log_analytics_workspace_name" {
  description = "Name of the workspace to deploy to be used for logging.Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "workspace_sku" {
  description = "SKU of the workspace to deploy to be used for logging.Changing this forces a new resource to be created."
  type        = string
  default     = "free"
}

variable "retention_in_days" {
  description = "Number of days that logs will be retained in the workspace."
  type        = number
  default     = 7
}

variable "log_analytics_workspace_tags" {
  description = "Tags which will be associated to the log analytics workspace."
  default     = {}
}

###
# Diagnostics settings
###

variable "diagnostics_count" {
  description = "How many diagnostics settings to create."
  default     = 1
}

variable "export_to_law" {
  description = "Allow export of logs and/or metrics to a Log Analytics Workspace."
  default     = true
}

variable "export_to_sa" {
  description = "Allow export of logs and/or metrics to a Storage Account."
  default     = false
}

variable "names" {
  description = "List which specifies the names of the diagnostics settings. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "target_resource_ids" {
  description = "The list of IDs of an existing resource on which to configure diagnostic settings. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "logs" {
  description = <<-DOCUMENTATION
  A list of list of map of options to apply. Map must support the following structure:
    * category(required, string): The name of a diagnostic log category for the resource. Note: The log categories available vary depending on the resource begin used. You may wish to use `azurerm_monitor_diagnostc_catehories` data source to identify which categories are available for a given resource.
    * enabled(Optional, boolean): Is this Diagnostic metric enabled?
    * retention_policy(Optional, list of map): A list of map of retention policies to apply
        * enabled(required, boolean): Is this retention policy enabled?
        * days(Optional, number): The number of days for which this retention policy should be applied. Note: Setting this to 0 will retain the events indefinetly.
  For example, see folder example/default folder.
  DOCUMENTATION
  type        = list
  default     = []

}

variable "metrics" {
  description = <<-DOCUMENTATION
  A list of list of map of options to apply. Map must support the following structure:
    * category(required, string): The name of a diagnostic log category for the resource. Note: The metric categories available vary depending on the resource begin used. You may wish to use `azurerm_monitor_diagnostc_catehories` data source to identify which categories are available for a given resource.
    * enabled(Optional, boolean): Is this Diagnostic metric enabled?
    * retention_policy(Optional, list of map): A list of map of retention policies to apply
        * enabled(required, boolean): Is this retention policy enabled?
        * days(Optional, number): The number of days for which this retention policy should be applied. Note: Setting this to 0 will retain the events indefinetly.
  For example, see folder example/default folder.
  DOCUMENTATION
  type        = list
  default = [
    [
      {
        category = "AllMetrics"
        enabled  = true

        retention_policy = [
          {
            enabled = false
            days    = 2
          }
        ]
      }
    ]
  ]
}
