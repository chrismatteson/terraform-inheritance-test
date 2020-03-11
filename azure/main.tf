provider "azurerm" {
  subscription_id = "a02c79ce-c03d-411f-9e5e-4f17b80eb809"
  features {}
}

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

module "submodule_no_provider" {
  source = "./modules/submodule_no_provider"
}

module "submodule_override_no_provider" {
  source = "./modules/submodule_no_provider"
  providers = {
    azurerm = azurerm
  }
}

module "submodule_provider_in_module" {
  source = "./modules/submodule"
}

module "submodule_override_provider_in_module" {
  source = "./modules/submodule"
  providers = {
    azurerm = azurerm
  }
}

output "submodule_provider_in_module_subscription_display_name" {
  value = module.submodule_provider_in_module.current_subscription_display_name
}

output "submodule_override_provider_in_module_subscription_display_name" {
  value = module.submodule_override_provider_in_module.current_subscription_display_name
}

output "submodule_no_provider_subscription_display_name" {
  value = module.submodule_no_provider.current_subscription_display_name
}
output "submodule_override_no_provider_subscription_display_name" {
  value = module.submodule_override_no_provider.current_subscription_display_name
}
