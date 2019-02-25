# Set value of variables to be used (terraform.tfvars is auto included)
# overrides defaults in variables.tf
loc     = "westeurope"

tags    = {
    source  = "citadel"
    env     = "training"
}

"webapplocs" = [
  "westeurope", 
  "northeurope",
  "uksouth",
  "ukwest",
]