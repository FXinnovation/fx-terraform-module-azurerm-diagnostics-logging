output "diagnostics_map" {
  value = map(
    "diags_sa", "${azurerm_storage_account.log.id}",
    "eh_name", "${azurerm_eventhub_namespace.log.name}",
    "eh_id", "${azurerm_eventhub_namespace.log.id}"
  )
}
