#creating a s3 backend to store the tfstate file.
#https://developer.hashicorp.com/terraform/language/settings/backends/s3

resource "null_resource" "test" {}

terraform {
  backend "s3" {
    bucket = "sri-d80-terraform"
    key    = "test/terraform.tfstate" #this is taking the tfstate from the test resource from previous folder. without that, this will not work.
    region = "us-east-1"
  }
}


