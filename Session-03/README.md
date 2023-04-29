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

#### Variables

Variables are useful to define values that can be reused across many resources. A central place where a change of value can be reflected everywhere it is used.

Datatypes of variables in terraform are
* string
* number
* list
* map
* boolean

```
variable "region" {
  type = string
  default = "us-west-2"
}

variable "port" {
  type = number
  default = 8080
}

variable "subnets" {
  type = list(string)
  default = ["subnet-1234abcd", "subnet-5678efgh"]
}

variable "tags" {
  type = map(string)
  default = {
    Name = "web-server"
    Environment = "dev"
  }
}
```

We use **variables.tf** file to declare variables, we can place default values here. **terraform.tfvars** is the file we declare the default values. We can override variable values from command line using -var "key=value".

#### Best Way:
* Create variables.tf and terraform.tfvars
* Place default values in variables.tf
* Override default values using terraform.tfvars. We usually don't commit terraform.tfvars into Git so that users can define their own values.
* Any variable can be overriden at run time using -var "key=value"

