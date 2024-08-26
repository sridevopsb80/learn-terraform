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
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami.html

A resource can be referred in another resource using provider_resource_label.local_resource_label.argument.
````
Data sources
````
As opposed to a resource, data sources are used to retrieve information from aws.
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
````
State file
````
Terraform maintains state information in tfstate file. State information can be stored in postgres database or in S3. check 10-remote-state.
https://developer.hashicorp.com/terraform/language/settings/backends/pg 
https://developer.hashicorp.com/terraform/language/settings/backends/s3

````

