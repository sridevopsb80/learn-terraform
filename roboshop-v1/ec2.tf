resource "aws_instance" "frontend" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-065fe091c4525f4dd"]

  tags = {
    Name = "frontend.dev"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z00376861T6KFA01SJSIS"
  name    = "frontend.dev.rdevopsb80.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongo" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-065fe091c4525f4dd"]

  tags = {
    Name = "mongo.dev"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z00376861T6KFA01SJSIS"
  name    = "mongo.dev.rdevopsb80.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
}

resource "aws_instance" "catalogue" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-065fe091c4525f4dd"]

  tags = {
    Name = "catalogue.dev"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z00376861T6KFA01SJSIS"
  name    = "catalogue.dev.rdevopsb80.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}

