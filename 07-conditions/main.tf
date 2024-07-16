# condition in terraform is to pick a value, Not about running the block

resource "aws_route53_record" "frontend" {
  zone_id = "Z00376861T6KFA01SJSIS"
  name    = "test.rdevopsb80.online"
  type    = "A"
  ttl     = 15
  records = ["1.1.1.1"]
}

