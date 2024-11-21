resource "aws_instance" "test" {
  ami                    = "ami-041e2ea9402c46c32"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-069109d11f4d4ff0f"]

  tags = {
    Name = "test"
  }
}

#output being sent from this module to root module
output "private_ip" {
  value = aws_instance.test.private_ip
}

