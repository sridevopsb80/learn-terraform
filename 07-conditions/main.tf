# condition in terraform is to pick a value, Not about running the block
# Syntax: = expression ? TRUE_VAL : FALSE_VAL

resource "aws_route53_record" "frontend" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "test.sridevops.site"
  type    = "A"
  ttl     = var.ttl == "" ? 15 : var.ttl #if var.ttl is empty(not provided during execution), use 15. otherwise use the provided value
  records = ["1.1.1.1"]
}

variable "ttl" {} #value will be asked during execution
