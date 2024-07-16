variable "ami" {
  default = "ami-041e2ea9402c46c32"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_group_ids" {
  default = ["sg-065fe091c4525f4dd"]
}

variable "zone_id" {
  default = "Z00376861T6KFA01SJSIS"
}

variable "domain_name" {
  default = "rdevopsb80.online"
}
