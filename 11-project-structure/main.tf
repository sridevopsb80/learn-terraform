
#creating a structure for various environments in the project

# config taken from 10-remote-state and edited to suit diff env info

terraform {
  backend "s3" {}
}

resource "null_resource" "test" {}

#Backend config
#To initialize the backend - terraform init -backend-config=env-dev/state.tfvars

#To remove initialization - ls -A -> remove .terraform folder using rm -rf command

