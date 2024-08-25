# condition in terraform is to pick a value, Not about running a block
# = expression ? TRUE_VAL : FALSE_VAL

resource "aws_route53_record" "frontend" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "test.sridevops.site"
  type    = "A"
  ttl     = var.ttl == "" ? 15 : var.ttl #if var.ttl is empty, use 15. else use the provided value
  records = ["1.1.1.1"]
}

variable "ttl" {}
