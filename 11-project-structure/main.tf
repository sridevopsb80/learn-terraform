terraform {
  backend "s3" {}
}

resource "null_resource" "test" {}

#Backend config
#
#To initialize the backend - terraform init -backend-config=env-dev/state.tfvars
#To remove initialization - ls -A -> remove .terraform folder using rm -rf command