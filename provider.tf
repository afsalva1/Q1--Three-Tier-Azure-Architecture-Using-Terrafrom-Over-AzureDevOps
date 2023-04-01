terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    } 
    azurerm = {
      source = "hashicorp/azurerm"
    } 
  }
}

provider "azurerm" {
  features {}
}

# Backedned Storeage for State File 
terraform {
  backend "azurerm" {
    
  }
}
