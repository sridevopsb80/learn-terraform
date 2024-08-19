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

A resource can be referred in another resource using provider_resource_label.local_resource_label.argument