// cloud_infra/variables.tf

variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure Region where resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network (e.g., 10.0.0.0/16)."
  type        = list(string)

  validation {
    condition     = length(var.address_space) > 0
    error_message = "At least one address space must be defined."
  }
}

variable "subnet_names" {
  description = "List of subnet names to create inside the VNet."
  type        = list(string)

  validation {
    condition     = length(var.subnet_names) > 0
    error_message = "At least one subnet name must be provided."
  }
}

variable "subnet_prefixes" {
  description = "List of subnet CIDR prefixes matching the subnet names."
  type        = list(string)

  validation {
    condition     = length(var.subnet_prefixes) == length(var.subnet_names)
    error_message = "The number of subnet prefixes must match the number of subnet names."
  }
}
