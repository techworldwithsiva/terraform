### State and Remote State

Terraform is a declarative way of approach. Declarative means whatever you write(declare) you will get it provided you will proper syntax.

Whenever terraform creates infra, it will create file called, it needs someway to track what it created
```
terraform.tfstate
```
TF files = whatever we want = Desired infra
terraform.tfstate = Actual Infra = current state of Infra

Desired Infra = Actual Infra

keeping terraform.tfstate in local is a problem, if you lose the data then terraform can't track what happened earlier. It will try to recreate