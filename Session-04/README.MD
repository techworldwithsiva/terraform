### Outputs

We are creating Infra, we want to see what are the outputs we can get through Infra. Syntax is
```
output "name_you_prefer" {

    value = ""
}
```

### Data Sources
Data source is useful to get the information from Cloud or any external provider. This information will be used as inputs for your infrastructure.
```
data "type_of_data_source" "preferred_name" {

}
```

### Functions

Functions are nothing but a unit of work, you can use functions repeatedly wherever and whenever you want. Terraform offers various kind of functions like
* Numeric
* String
* Network
* File, etc