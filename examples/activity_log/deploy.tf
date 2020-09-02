resource "random_string" "this" {
  length  = 4
  upper   = false
  special = false
}

module "resource_group_demo" {
  source   = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=1.0.0"
  location = "francecentral"
  name     = "tftest${random_string.this.result}"

  tags = {
    Owner   = "Terraform"
    EndDate = "2020-05-25"
  }
}

module "example" {
  source = "../.."

  resource_group_name       = module.resource_group_demo.name
  resource_group_location   = module.resource_group_demo.location

  log_analytics_workspace_name = "tftest${random_string.this.result}"
  workspace_sku                = "free"
  retention_in_days            = 1

  diagnostics_count   = 1
  names               = ["tftest${random_string.this.result}"]
  target_resource_ids = [data.azurerm_subscription.this.id]
  logs                = [
    [
      {
        category = "Administrative"
        enabled  = true

        retention_policy = []
      },
      {
        category = "Security"
        enabled  = true

        retention_policy = []
      },
      {
        category = "ServiceHealth"
        enabled  = true

        retention_policy = []
      },
      {
        category = "Alert"
        enabled  = true

        retention_policy = []
      },
      {
        category = "Recommendation"
        enabled  = true

        retention_policy = []
      },
      {
        category = "Policy"
        enabled  = true

        retention_policy = []
      },
      {
        category = "Autoscale"
        enabled  = true

        retention_policy = []
      },
      {
        category = "ResourceHealth"
        enabled  = true

        retention_policy = []
      }
    ]
  ]
  metrics = [[]]
}
