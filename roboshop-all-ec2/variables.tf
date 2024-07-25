variable "domain_name" {
  default = "rdevopsb80.online"
}

variable "components" {
  default = {
    frontend  = {}
    mongo     = {}
    catalogue = {}
    redis     = {}
    rabbitmq  = {}
    mysql     = {}
    user      = {}
    cart      = {}
    shipping  = {}
    payment   = {}
    dispatch  = {}
  }
}


