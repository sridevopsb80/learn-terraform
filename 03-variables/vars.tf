#Variable block

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

# Values, numbers and booleans need not be quoted. Strings must be quoted. Only double quotes are allowed in terraform.

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

# If we are accessing a Variable along with a string then we need to refer the variable with ${}.
output "x1" {
  value = "Value of x - ${var.x}"
}

output "l" {
  value = var.l[0]
}
#calling the first value in var l.var.indexnumber

output "m" {
  value = "Course Name - ${var.m["course"]} , Trainer Name - ${var.m["trainer"]}"
}


###
#since the value is not specified here, it needs to be passed at the time of execution.
variable "c" {
  type = number
  #value is mentioned to be a number specifically. if this is not provided, it might be considered as a string. when it is run as a string, 100 will be shown as "100" since it is considered as a string and string needs to be in double-quotes.
}

output "c" {
  value = var.c
}

### here, we are not providing a value for c in this file like the other examples. the value is defined in terraform.tfvars and demo.tfvars.
# terraform.tfvars is the default file (has default higher precedence) it would be picked up from.
# to make it choose demo.tfvars, we need to pass it while executing the command: terraform init; terraform apply -var-file=demo.tfvars
#
# if there is no value mentioned in any files, there will be a prompt for the value of c, while running terraform apply. if no value is provided, it will not show any value. to provide a value during execution, use -var c=100. the value of c can be a number or a string or boolean.


variable "c" { }

output "c" {
  value = var.c
}


