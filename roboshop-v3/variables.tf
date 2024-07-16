variable "instance_type" {
  default = "t3.small"
}

variable "domain_name" {
  default = "rdevopsb80.online"
}

variable "components" {
  default = ["frontend", "catalogue", "mongo"]
}