variable "domain_name" {
  default = "sridevops.site"
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


