#resources are part of providers and can be found under documentation under providers in terraform registry.

#arguments are inputs. attributes are values that can be used after the creation of the resource. for example, in case of ami, it might be the private ip.

resource "aws_instance" "web" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.micro"

  tags = {
    Name = "demo-for-terraform"
  }
}


