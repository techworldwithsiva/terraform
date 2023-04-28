resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet-automated-vpc"
  }
}

resource "aws_vpc" "main" { #this name belongs to only terraform reference

    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "automated-vpc" #this name belongs to AWS
    }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet-automated-vpc"
  }
}

resource "aws_internet_gateway" "automated-igw" {
  vpc_id = aws_vpc.main.id # internet gateway depends on VPC

  tags = {
    Name = "automated-somechange"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.automated-igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_eip" "auto-eip" {

}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.auto-eip.id
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "automated-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.automated-igw]
}

resource "aws_route_table" "private-rt" { #for private route we don't attach IGW, we attach NAT
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }

  tags = {
    Name = "private-rt"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
