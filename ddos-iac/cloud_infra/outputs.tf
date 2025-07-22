output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "The list of subnet IDs"
  value       = [for s in azurerm_subnet.this : s.id]
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.this.name
}
