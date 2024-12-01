#https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret
# var.vault.token value will be passed in cli during execution

variable "vault_token" {}


data "vault_generic_secret" "rundeck_auth" {
  path = "kv/test"
}

provider "vault" {
  address         = "https://vault-internal.sridevops.site:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

#creating a local file to store the password
resource "local_file" "foo" {
  content  = data.vault_generic_secret.rundeck_auth.data["MYPASS"]
  filename = "/tmp/foo.bar"
}

#output will not be displayed since it is sensitive data
output "test" {
  value = data.vault_generic_secret.rundeck_auth.data["MYPASS"]
}


