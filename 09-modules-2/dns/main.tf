resource "aws_route53_record" "frontend" {
  zone_id = "Z00376861T6KFA01SJSIS"
  name    = "test1.sridevops.site"
  type    = "A"
  ttl     = 15
  records = [var.private_ip]
}

variable "private_ip" {}
