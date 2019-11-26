# terraform-module-azurerm-diagnostics-logging

## Usage

This module is used to deploy multiple resources (storage account, event hub and log analytics workspace) that will be used for the gathering of diagnostic informations and logging.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | Enable or disable module. | bool | `"true"` | no |
| event\_hub\_namespace\_name | Name of the event hub namespace to be used as a target for the logs. | string | n/a | yes |
| location | Location where the resources will be deployed. | string | `""` | no |
| log\_analytics\_workspace\_name | Number of days the workspace to deploy will retain logs. | number | `"7"` | no |
| log\_analytics\_workspace\_name | Name of the workspace to deploy to be used for logging. | string | n/a | yes |
| log\_analytics\_workspace\_sku | SKU of the workspace to deploy to be used for logging. | string | `"free"` | no |
| resource\_group\_name | Name of the resource group where the resource will be deployed. | string | n/a | yes |
| storage\_account\_name | Name of the storage account to be used to host the logs. | string | n/a | yes |
| subscription\_logs\_retention | Number of days to retain activity logs in the storage account. | number | `"0"` | no |
| tags | Tags to add to the resources. | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| diagnostics\_map |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Examples

Usage example is found in the `./examples/default/` folder.

## Inspec

No Inspec tests are done for this module.
