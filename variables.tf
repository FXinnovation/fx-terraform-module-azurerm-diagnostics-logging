variable "enabled" {
  description = "Enable or disable module."
  type        = bool
  default     = true
}

variable "location" {
  description = "Location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Name of the resource group where the resource will be deployed."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account to be used to host the logs."
  type        = string
}

variable "event_hub_namespace_name" {
  description = "Name of the event hub namespace to be used as a target for the logs."
  type        = string
}

variable "subscription_logs_retention" {
  description = "Number of days to retain activity logs in the storage account."
  type        = number
  default     = 0 # 0 = no rotation
}

variable "log_analytics_workspace_name" {
  description = "Name of the workspace to deploy to be used for logging."
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "SKU of the workspace to deploy to be used for logging."
  type        = string
  default     = "free"
}

variable "log_analytics_workspace_name" {
  description = "Number of days the workspace to deploy will retain logs."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags to add to the resources."
  type        = map
  default     = {}
}
