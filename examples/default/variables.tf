variable "tenant_id" {
  description = "Azure tenant Id."
}

variable "subscription_id" {
  description = "Azure subscription Id."
}

variable "client_id" {
  description = "Azure service principal application Id."
}

variable "client_secret" {
  description = "Azure service principal application Secret."
}

variable "resource_group_name" {
  description = "Resource group where the vnet resides."
  type        = string
  default     = "fxcozca1dgenrg005"
}

variable "location" {
  description = "Location of the resources."
  type        = string
  default     = "canadacentral"
}

variable "tags" {
  description = "Tags to add to the virtual network."
  default = {
    FXOwner      = "Test user"
    FXProjet     = "FXCO"
    FXDepartment = "Cloud"
  }
  type = map
}

variable "storage_account_name" {
  description = "Name of the storage account to be used to host the logs."
  type        = string
  default     = "fxcozca1dgensa006"
}

variable "event_hub_namespace_name" {
  description = "Name of the event hub namespace to be used as a target for the logs."
  type        = string
  default     = "fxcozca1dgeneh005"
}

variable "subscription_logs_retention" {
  description = "Number of days to retain activity logs in the storage account."
  type        = number
  default     = 0 # 0 = no rotation
}

variable "log_analytics_workspace_name" {
  description = "Name of the workspace to deploy to be used for logging."
  type        = string
  default     = "fxcozca1dgenla005"
}

variable "log_analytics_workspace_sku" {
  description = "SKU of the workspace to deploy to be used for logging."
  type        = string
  default     = "free"
}

variable "log_analytics_workspace_retention_in_days" {
  description = "Number of days the workspace to deploy will retain logs."
  type        = number
  default     = 7
}
