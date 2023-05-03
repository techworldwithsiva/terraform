data "aws_ami" "ami_info"{
    most_recent      = true
    #owners           = [var.aws_accounts[data.aws_region.current.name]] # this is the official amazon account ID itself
    owners           = [lookup(var.aws_accounts,data.aws_region.current.name)]
    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-*-x86_64-gp2"]
   }

   filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

# I want to fetch which region I am in. This example will fetch the info regarding your current region.
data "aws_region" "current" {}



# I want to get the VPC information of an existing VPC. 
data "aws_vpc" "existing_vpc" {
  id = "vpc-0720a5c2fc7a18218"
}

