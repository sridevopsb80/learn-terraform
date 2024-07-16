resource "null_resource" "test" {
  count = 3
}

variable "components" {
  default = ["frontend", "catalogue", "mongo"]
}

resource "null_resource" "test1" {
  count = length(var.components)
}
