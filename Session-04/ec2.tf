resource "aws_instance" "web"{

    ami =  local.ami_id#AMI ID will be different every region, this is OS
    instance_type = "t3.micro"
    key_name = aws_key_pair.terraform.key_name
}

resource "aws_key_pair" "terraform" {
    key_name   = "terraform"
    # this file function will read the terraform.pub and fetch the content
    public_key = file("${path.module}/terraform.pub")
}