#refer to notes on loops-1 and loops-2 to find out why for_each is being used.

resource "aws_instance" "instance" {

  for_each = var.components
  #defining the variable being used for for_each loop

  ami                    = data.aws_ami.ami.image_id
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = data.aws_security_groups.sg.ids

  tags = {
    Name = "${each.key}.dev"
  }
}


resource "aws_route53_record" "dns_record" {
  for_each = var.components
  #defining the variable being used for for_each loop
  zone_id  = data.aws_route53_zone.zone.zone_id
  name     = "${each.key}.dev.${var.domain_name}"
  type     = "A"
  ttl      = 15
  records  = [aws_instance.instance[each.key].private_ip]
}

