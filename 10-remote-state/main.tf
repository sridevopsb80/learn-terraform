#creating a s3 backend to store the tfstate file

resource "null_resource" "test" {}

terraform {
  backend "s3" {
    bucket = "d80-terraform"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}


