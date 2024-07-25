resource "null_resource" "fruits" {
  for_each = var.fruits
}

variable "fruits" {
  default = {
    apple = {
      name     = "apple"
      quantity = 100
    }
    banana = {
      name     = "banana"
      quantity = 20
    }
  }
}

resource "null_resource" "instances" {
  for_each = var.instances
}

variable "instances" {
  default = {
    frontend  = {}
    catalogue = {}
    mongo     = {}
  }
}

