locals {
    #locals can store the values of functions and expressions and you can use wherever you require
  instance_name = join("-",[var.instance_name, var.environment])
}