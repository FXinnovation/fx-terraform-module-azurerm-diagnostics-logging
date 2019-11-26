# terraform-example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_id | Azure service principal application Id. | string | n/a | yes |
| client\_secret | Azure service principal application Secret. | string | n/a | yes |
| event\_hub\_namespace\_name | Name of the event hub namespace to be used as a target for the logs. | string | `"fxcozca1dgeneh005"` | no |
| location | Location of the resources. | string | `"canadacentral"` | no |
| log\_analytics\_workspace\_name | Name of the workspace to deploy to be used for logging. | string | `"fxcozca1dgenla005"` | no |
| log\_analytics\_workspace\_retention\_in\_days | Number of days the workspace to deploy will retain logs. | number | `"7"` | no |
| log\_analytics\_workspace\_sku | SKU of the workspace to deploy to be used for logging. | string | `"free"` | no |
| resource\_group\_name | Resource group where the vnet resides. | string | `"fxcozca1dgenrg005"` | no |
| storage\_account\_name | Name of the storage account to be used to host the logs. | string | `"fxcozca1dgensa006"` | no |
| subscription\_id | Azure subscription Id. | string | n/a | yes |
| subscription\_logs\_retention | Number of days to retain activity logs in the storage account. | number | `"0"` | no |
| tags | Tags to add to the virtual network. | map | `{ "FXDepartment": "Cloud", "FXOwner": "Test user", "FXProjet": "FXCO" }` | no |
| tenant\_id | Azure tenant Id. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
