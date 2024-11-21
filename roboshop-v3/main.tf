#loops are used to eliminate declaring instances individually. we are using count and length approach in this iteration

resource "aws_instance" "instance" {
  count                  = length(var.components)
  #length is used to count number of components and provision accordingly. since 3 values  are defined under component variable, count will be 3 and the index values will be 0,1,2.
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg.ids

  tags = {
    Name = "${var.components[count.index]}.dev"
    #referencing count from instance resource and taking the index value. Index values 0,1,2 correspond to frontend, mongo and catalogue as defined in the component variable.
  }
}


resource "aws_route53_record" "dns_record" {
  count   = length(var.components)
  #length is used to count number of components and provision accordingly. since 3 values  are defined under component variable, count will be 3 and the index values will be 0,1,2.
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${var.components[count.index]}.dev.${var.domain_name}"
  #referencing count from instance resource and taking the index value. Index values 0,1,2 correspond to frontend, mongo and catalogue as defined in the component variable.
  type    = "A"
  ttl     = 15
  records = [aws_instance.instance[count.index].private_ip]
  #since we have multiple instances, we are using count there
}

