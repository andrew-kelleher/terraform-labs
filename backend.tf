terraform {
  backend "azurerm" {
  storage_account_name = "terraformlabs"
  container_name       = "tfstate-nonprod"
  key                  = "tfstate-nonprod-labs.terraform.tfstate"
  access_key           = "+QMvFnBS/XCW5vdfIjWoUo/DtdreoTa6E0R/UnS3ji7m1IeSF/cYuU3p7uE+hczOKdVOfOYXSqaJZD+z0mAzCQ=="
  }
}