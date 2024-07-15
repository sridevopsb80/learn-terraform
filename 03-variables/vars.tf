# Plain variable

# Number
variable "x" {
  default = 10
}

# Boolean
variable "y" {
  default = true
}

# String
variable "z" {
  default = "Hello"
}

# Values numbers and booleans need not to be quoted



# outputs
# Direct values does not require to be accessed with ${}
output "x" {
  value = var.x
}

# Accessing Variable has a combination with a string then we need to refer the variable with ${}
output "x1" {
  value = "Value of x - ${var.x}"
}



