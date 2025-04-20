# Deploy Azure AI Services resource
resource "azurerm_ai_services" "AIServicesResource" {
  name                = "${local.group_name_lower}-ai-svc-res-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0" # Pricing SKU tier

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = local.group_name
  }
}

resource "azurerm_cognitive_account" "default" {
  name                = "${local.group_name_lower}-ai-svc-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "CognitiveServices"

  tags = {
    environment = local.group_name
  }
}
