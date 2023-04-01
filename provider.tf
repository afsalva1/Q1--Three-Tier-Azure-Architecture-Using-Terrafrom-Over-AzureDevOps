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
terraform {
  backend "azurerm" {
    
  }
}
