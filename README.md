# learn-terraform

Terraform executes all .tf files in a folder.

To initialize folder
````
terraform init
````
Plan
````
terraform plan
````
Apply
````
terraform apply
````
Destroy without prompt
````
terraform destroy -auto-approve
````
Resources
````
Resources are part of providers and can be found under documentation under providers in terraform registry. Arguments are inputs. Attributes are values that can be used after the creation of the resource. For example, in case of ami, it might be the private ip.

A resource can be referred in another resource using provider_resource_label.local_resource_label.argument.
````