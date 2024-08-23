#works on maps variable unlike count which is list

variable "domain_name" {
  default = "sridevops.site"
}

#for_each.key=frontend
#for_each.value=instance_type
variable "components" {
  default = {
    frontend = {
      instance_type = "t3.micro"
    }
    mongo = {
      instance_type = "t3.small"
    }
    catalogue = {
      instance_type = "t3.micro"
    }
  }
}

