#Using provisioner to use ansible after using terraform to create resources.

# https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax

resource "aws_instance" "instance" {

  for_each = var.components

  ami                    = data.aws_ami.ami.image_id
  instance_type          = each.value["instance_type"]
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

#as denoted by depends_on, resource will only run based on aws_route53_record.dns_record resource creation
resource "null_resource" "ansible" {
  depends_on = [aws_route53_record.dns_record]
  for_each   = var.components

  #remote-exec provisioner is used to connect to remote nodes. provisioning and configuring instances
  provisioner "remote-exec" {
    connection {
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance[each.key].private_ip
    }
# using ansible pull
    inline = [
      "sudo pip-3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/sridevopsb80/roboshop_ansible main.yml -e env=dev -e role_name=${each.key}"
    ]

  }
}

# Remember that only three components are defined in var.components. this will execute those 3, but if we need to execute the whole list of services, they need to be defined under the variable values.

# In case we include provisioner code block as part of the resource creation for instance, if there is a failure from the provisioner code block and resource creation is not a failure, provisioner will try to recreate the resource. To avoid this problem, it is advisable to use a separate null_resource code block to use provisioner.