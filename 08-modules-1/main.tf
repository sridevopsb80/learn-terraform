#https://developer.hashicorp.com/terraform/language/modules

module "example" {
  source = "./example"
  #calls child module example
  input  = 3
  #value for input is defined here
}