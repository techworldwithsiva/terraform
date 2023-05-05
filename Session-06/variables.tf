variable "tags" {
  default = {
    Name = "timing"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "igw_tags" {
  default = {
    Name = "timing" #don't repeat resource Name itself
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "public_subnet_tags" {
  default = {
    Name = "public-subnet-timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "private_subnet_tags" {
  type = map
  default = {
    Name = "private-subnet-timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "public_route_table_tags" {
  type = map
  default = {
    Name = "public-route-table-timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "nat_tags" {
  type = map
  default = {
    Name = "timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "private_route_table_tags" {
  type = map
  default = {
    Name = "private-route-table-timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "database_subnet_tags" {
  type = map
  default = {
    Name = "database-subnet-timing" #resourceName-projectName
    Environment = "DEV"
    Terraform = "true"
  }
}