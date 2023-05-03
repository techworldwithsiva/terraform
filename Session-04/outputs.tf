output "ip_address" {
  value = aws_instance.web.public_ip
}

output "ami_id" {
  value = data.aws_ami.ami_info.image_id
}

output "vpc_info" {
  value = data.aws_vpc.existing_vpc
}

output "current_region" {
  value = data.aws_region.current.name
}