resource "null_resource" "test" {
  count = 3
}

variable "components" {
  default = ["frontend", "mongo", "catalogue"]
}

resource "null_resource" "test1" {
  count = length(var.components)
}
