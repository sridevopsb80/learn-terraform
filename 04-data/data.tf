#as opposed to resource, data sources are used to retrieve information from aws

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice" #name of the ami
  owners      = ["973714476881"] #amazon owner account number
}

output "ami" {
  value = data.aws_ami.example # format for referring a resource - provider_resource_label.local_resource_label.argument. data block needs to be prefixed with data unlike resource.
}
