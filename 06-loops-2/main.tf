#count is not widely used in loops. for_each is preferred, which works on maps variable unlike count which is list variable.

resource "null_resource" "fruits" {
  for_each = var.fruits
}

#for_each.key=apple
#for_each.value=name,quantity
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

#output will show null_resource.fruits[apple], null_resource.fruits[banana] which is easier to identify.

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

