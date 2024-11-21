resource "aws_route53_record" "frontend" {
  zone_id = "Z02073473N3J0S3WVZG5G"
  name    = "test1.sridevops.site"
  type    = "A"
  ttl     = 15
  records = [var.private_ip]
  #value is taken from ec2 module via root module
}

variable "private_ip" {}
#variable is defined so that value can be obtained from root module
