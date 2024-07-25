resource "aws_instance" "instance" {

  for_each = var.components

  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.small"
  vpc_security_group_ids = data.aws_security_groups.sg.ids

  tags = {
    Name = "${each.key}.dev"
  }
}


resource "aws_route53_record" "dns_record" {
  for_each = var.components
  zone_id  = data.aws_route53_zone.zone.zone_id
  name     = "${each.key}.dev.${var.domain_name}"
  type     = "A"
  ttl      = 15
  records  = [aws_instance.instance[each.key].private_ip]
}

