### State

Terraform is a declarative way of approach. Declarative means whatever you write(declare) you will get it provided you will follow proper syntax.

Whenever terraform creates infra, it will create file called **terraform.tfstate**, it needs someway to track what it created, that is state file

TF files = whatever we want = Desired infra <br />
terraform.tfstate = Actual Infra = current state of Infra

Terraform responsibility is to maintain

Desired Infra = Actual Infra

### Remote State

keeping terraform.tfstate in local is a problem, 

* if you lose the data then terraform can't track what happened earlier. It will try to recreate again.
* In case of version control, keeping the terraform state in GitHub also causes problem while infra is creating through CICD. If multiple triggers to the pipeline then duplicate infra would be created.
* It is best practice to keep the state file in remote locations like S3 for better collaboration between team members.

Now where ever we run terraform apply it connects to S3 and avoid the situations of duplicate infra. We need to lock with dynamodb so that multiple persons can't apply at the same time.
