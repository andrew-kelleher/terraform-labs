# Define our expected variables and default values
variable "loc" {
    description = "Default Azure region"
    default     =   "WestEurope"
}

variable "tags" {
    description = "tags to apply to resources"
    default     = {
        source  = "citadel"
        env     = "training"
    }
}

variable "webapplocs" { # defining but not setting a value
  description = "web app locations"
  type = "list"
}
