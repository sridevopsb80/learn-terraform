#check notes in roboshop-v3

resource "null_resource" "test" {
  count = 3
}

###########

variable "components" {
  default = ["frontend", "mongo", "catalogue"]
  #list value
}

resource "null_resource" "test1" {
  count = length(var.components)
  #length is a function used to count values in list format.
}

#count is not widely used in terraform loops. for_each is preferred, which works on maps variable unlike count which is list variable.

# while using count, the output of test1 resource under execution will be displayed as test1[0], test1[1], test1[2] which corresponds to frontend, mongo and catalogue, but does not indicate which component is being executed. count displays the index position and not the value. while using count, if there is a failure, it might not be easy to identify where the issue is, if we are dealing with a variable that has many values in it as opposed to just 3 as defined here.

#Also, if there is a change in the index position of a value (whether the values are interchanged or new values are added), terraform will delete the resources that are affected and recreate them. This is not a good option to use in production and for-each should be preferred since for-each does not use index position but uses key/value (name).
#https://spacelift.io/blog/terraform-count-for-each