# terraform-example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | >= 1.36.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_id | Azure service principal application Id. | `any` | n/a | yes |
| client\_secret | Azure service principal application Secret. | `any` | n/a | yes |
| event\_hub\_namespace\_name | Name of the event hub namespace to be used as a target for the logs. | `string` | `"fxcozca1dgeneh005"` | no |
| location | Location of the resources. | `string` | `"canadacentral"` | no |
| log\_analytics\_workspace\_name | Name of the workspace to deploy to be used for logging. | `string` | `"fxcozca1dgenla005"` | no |
| log\_analytics\_workspace\_retention\_in\_days | Number of days the workspace to deploy will retain logs. | `number` | `7` | no |
| log\_analytics\_workspace\_sku | SKU of the workspace to deploy to be used for logging. | `string` | `"free"` | no |
| resource\_group\_name | Resource group where the vnet resides. | `string` | `"fxcozca1dgenrg005"` | no |
| storage\_account\_name | Name of the storage account to be used to host the logs. | `string` | `"fxcozca1dgensa006"` | no |
| subscription\_id | Azure subscription Id. | `any` | n/a | yes |
| subscription\_logs\_retention | Number of days to retain activity logs in the storage account. | `number` | `0` | no |
| tags | Tags to add to the virtual network. | `map` | <pre>{<br>  "FXDepartment": "Cloud",<br>  "FXOwner": "Test user",<br>  "FXProjet": "FXCO"<br>}</pre> | no |
| tenant\_id | Azure tenant Id. | `any` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
