resource "null_resource" "test" {
  count = var.input
  #resource will be run after value is obtained from main.tf after input is defined as a variable in example/vars.tf
}
