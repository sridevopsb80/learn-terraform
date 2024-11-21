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
## Functions and Loops

Length function is used to count values in list format. 
Example: 
````
count = length(var.components)
````
Functions documentation:
````
https://developer.hashicorp.com/terraform/language/functions
https://developer.hashicorp.com/terraform/language/functions/length
````

Two types of loops:
1. Count - not widely used. Used for list variables. As mentioned above, can be used along with length function to count the number of list variables. 
````
count = length(var.components)
````
2. For each loop - preferred. Used for map variables. 
Refer roboshop-v3->main.tf notes for detailed info (along with example) on why for each is preferred over count.
````
for_each = var.fruits
````

Documentation:
````
https://spacelift.io/blog/terraform-count-for-each
https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
````

## Conditionals

In terraform, conditional is not used to run a block of code (as it is used in shell or ansible). Here, it is used to pick a value.
Syntax:
````
= expression ? TRUE_VAL : FALSE_VAL
````

## Modules

Modules are the main way to package and reuse resource configurations with Terraform. Similar to roles in ansible. Every terraform configuration has at least one module, which is called as the root module. A module can call other modules (called child modules) to include their resources into the configuration. Check modules-1 (root-child) and modules-2(child-child) folder for example of how values are passed between modules. 

Documentation:
````
https://developer.hashicorp.com/terraform/language/modules
````