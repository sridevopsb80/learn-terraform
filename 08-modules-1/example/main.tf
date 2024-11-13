resource "null_resource" "test" {
  count = var.input #value is obtained from main.tf after input is defined as a variable in example/vars.tf
}
