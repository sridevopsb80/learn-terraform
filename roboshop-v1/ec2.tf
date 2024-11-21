resource "aws_instance" "frontend" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-069109d11f4d4ff0f"]
  # a list of security group ids to associate. provided id is for allow-all.

  tags = {
    Name = "frontend.dev"
    #this is the instance name
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "frontend.dev.sridevops.site"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongo" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-069109d11f4d4ff0f"]

  tags = {
    Name = "mongo.dev"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "mongo.dev.sridevops.site"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
  #provider_resource_label.local_resource_label.argument
}

resource "aws_instance" "catalogue" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-069109d11f4d4ff0f"]

  tags = {
    Name = "catalogue.dev"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "catalogue.dev.sridevops.site"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}

