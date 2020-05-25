# terraform-module-azurerm-diagnostics-logging

## Usage

This module is used to deploy multiple resources (storage account, event hub and log analytics workspace) that will be used for the gathering of diagnostic informations and logging.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_replication\_type | The type of replication to use for this storage account. Valid options are 'LRS','GRS','RAGRS' and 'ZRS'. | `string` | `"LRS"` | no |
| account\_tier | Type of the tier to use for the storage account.Changing this force a new resource to be created. | `string` | `"Standard"` | no |
| diagnostics\_count | How many diagnostics settings to create. | `number` | `1` | no |
| enable\_https\_tarffic\_only | Boolean flag which forces HTTPS if enabled. | `bool` | `true` | no |
| enabled | Enable or disable module. | `bool` | `true` | no |
| log\_analytics\_detination\_type | when set to `Dedicated  logs sent to a log analytics workspace will go into resource specific tables, instead of the legacy Azurediagnostics table. Note: This setting will only have an effect if a  `log\_analytics\_workspace\_id` is provided, and the resource is avaliable for resource-specific logs.` | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| log\_analytics\_tags | Tags which will be associated to the log analytics workspace. | `map` | `{}` | no |
| log\_analytics\_workspace\_name | Name of the workspace to deploy to be used for logging.Changing this forces a new resource to be created. | `string` | `""` | no |
| logs | A list of list of map of options to apply. Map must support the following structure:<br>  * category(required, string): The name of a diagnostic log category for the resource. Note: The log categories available vary depending on the resource begin used. You may wish to use `azurerm_monitor_diagnostc_catehories` data source to identify which categories are available for a given resource.<br>  * enabled(Optional, boolean): Is this Diagnostic metric enabled?<br>  * retention\_policy(Optional, list of map): A list of map of retention policies to apply<br>      * enabled(required, boolean): Is this retention policy enabled?<br>      * days(Optional, number): The number of days for which this retention policy should be applied. Note: Setting this to 0 will retain the events indefinetly.<br>For example, see folder example/default folder. | `list` | `[]` | no |
| metric | A list of list of map of options to apply. Map must support the following structure:<br>  * category(required, string): The name of a diagnostic log category for the resource. Note: The metric categories available vary depending on the resource begin used. You may wish to use `azurerm_monitor_diagnostc_catehories` data source to identify which categories are available for a given resource.<br>  * enabled(Optional, boolean): Is this Diagnostic metric enabled?<br>  * retention\_policy(Optional, list of map): A list of map of retention policies to apply<br>      * enabled(required, boolean): Is this retention policy enabled?<br>      * days(Optional, number): The number of days for which this retention policy should be applied. Note: Setting this to 0 will retain the events indefinetly.<br>For example, see folder example/default folder. | `list` | `[]` | no |
| names | List which specifies the names of the diagnostics settings. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| resource\_group\_location | Location where the resources will be deployed.Changing this forces a new resource to be created. | `string` | `"canadacentral"` | no |
| resource\_group\_name | Name of the resource group where the resource will be deployed.Changing this forces a new resource to be created. | `string` | `""` | no |
| retention\_in\_days | Number of days that logs will be retained in the workspace. | `number` | `7` | no |
| storage\_account\_exist | Boolean flag which describes whhether the storage account is already existing or not. | `bool` | `false` | no |
| storage\_account\_name | Name of the storage account to be used to host the logs. Changing forces a new resource to be created. | `string` | `""` | no |
| storage\_account\_tags | Tags which will specifically assigned to the storage account. | `map` | `{}` | no |
| storage\_containers | List of containers to create and their access levels. | `list(object({ name = string, access_type = string }))` | `[]` | no |
| tags | Tags shared by all resource of tis module. Will be merged with any other specific tags by resource. | `map` | `{}` | no |
| target\_resource\_ids | The list of IDs of an existing resource on which to configure diagnostic settings. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| workspace\_exist | Boolean flag which describes whhether the log analytics workspace is already existing or not. | `bool` | `false` | no |
| workspace\_sku | SKU of the workspace to deploy to be used for logging.Changing this forces a new resource to be created. | `string` | `"free"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the diagnostics setting. |
| log\_analytics\_primary\_shared\_key | n/a |
| log\_analytics\_secondary\_shared\_key | n/a |
| log\_analytics\_workspace\_id | n/a |
| storage\_account\_id | The ID of the storage account. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
