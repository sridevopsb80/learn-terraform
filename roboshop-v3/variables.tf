variable "instance_type" {
  default = "t3.small"
}

variable "domain_name" {
  default = "sridevops.site"
}

variable "components" {
  default = ["frontend", "mongo", "catalogue"]
}