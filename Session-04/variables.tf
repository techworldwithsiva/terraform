variable "aws_accounts" {
  type = map
  default = {
    "ap-south-1" = "137112412989" # these are official AWS Account ID
    "ap-south-2" = "140264529686"
  }
}
#how you get value from map
# map_name("key")
# aws_accounts["ap-south-1"]