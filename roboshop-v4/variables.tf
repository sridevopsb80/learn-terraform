#for each works on maps variable unlike count which is list

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

#
#resource "aws_instance" "instance" {
#
#  for_each = var.components #defining the variable being used for for_each loop
#
#  ami                    = data.aws_ami.ami.image_id
#  instance_type          = each.value["instance_type"] #here, we are calling the value instance type specifically
#  vpc_security_group_ids = data.aws_security_groups.sg.ids
#
#  tags = {
#    Name = "${each.key}.dev" #each.key value will correspond to the defined keys - frontend, mongo, catalogue
#  }
#}
