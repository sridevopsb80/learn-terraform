# learn-terraform

Code in blocks, denoted by {}. Various blocks are: resource block, variable block, output block, data block, local block, module block, provider block.

Terraform loads all .tf files in a folder. 

## Install terraform

Documentation:
````
https://developer.hashicorp.com/terraform/install
````

## Terraform phases for execution

To initialize folder. Downloads necessary provider plugin. 
````
terraform init
````
Plan
````
terraform plan
````
Apply - If the resource already exists, it will not be recreated.
````
terraform apply
````
Destroy without prompt
````
terraform destroy -auto-approve
````

## Resources

Used to provision resources.

Resources are part of providers and can be found under documentation under providers in terraform registry. 
Arguments are inputs (keys).
Attributes are values that can be used after the creation of the resource. For example, in case of ami, it might be the private ip.
A resource can be referred in another resource using provider_resource_label.local_resource_label.argument. Ex: aws_instance.catalogue.private_ip

Documentation: 
````
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami.html

````

## Data sources

As opposed to a resource, data sources are used to retrieve information from aws.

Documentation:
````
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
````
## State file

Terraform maintains resource state information in tf state file. State information can be stored in postgres database or in S3. check 10-remote-state.
````
https://developer.hashicorp.com/terraform/language/settings/backends/pg - postgres
https://developer.hashicorp.com/terraform/language/settings/backends/s3 - s3
````


