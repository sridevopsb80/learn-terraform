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

# Values numbers and booleans need not be quoted. Strings must be.

# List Variable
variable "l" {
  default = [10, 20, "abc", false]
}
# values in list need not to be same data type

# Map Variable
variable "m" {
  default = {
    course  = "DevOps"
    trainer = "John"
  }
}

# outputs
# Direct values does not require to be accessed with ${}
output "x" {
  value = var.x
}

# If we are accessing a Variable along with a string then we need to refer the variable with ${}
output "x1" {
  value = "Value of x - ${var.x}"
}

output "l" {
  value = var.l[0] #calling the first value in var l
}

output "m" {
  value = "Course Name - ${var.m["course"]} , Trainer Name - ${var.m["trainer"]}"
}


###
variable "c" {
  type = number #value is mentioned to be a number specifically. it cannot be any other.
}

output "c" {
  value = var.c
}

### here, we are not providing a value for c. while running terraform apply, there will be a prompt for the value of c. if no value is provided, it will not show any value. to provide a value during execution, use -var c=100. the value of c can be a number or a string or boolean.

variable "c" { }

output "c" {
  value = var.c
}


