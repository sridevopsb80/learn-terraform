# condition in terraform is to pick a value, Not about running the block
# Syntax: = expression ? TRUE_VAL : FALSE_VAL

resource "aws_route53_record" "frontend" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "test.sridevops.site"
  type    = "A"
  ttl     = var.ttl == "" ? 15 : var.ttl
  #if var.ttl is empty(""), use 15. otherwise use the provided value. not that this scenario is dealing with value being provided during execution in cli
  records = ["1.1.1.1"]
}

variable "ttl" {}
#while variable ttl is defined, value is not defined. value will be asked during execution
