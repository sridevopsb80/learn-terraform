terraform {
  backend "s3" {}
}

resource "null_resource" "test" {}

#Backend config
#
#terraform init -backend-config=env-dev/state.tfvars