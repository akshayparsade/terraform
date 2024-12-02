# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  tags = {
    Name = "${var.project}-VPC"
    env = var.env
  }
}

# Create Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr
  tags = {
    Name = "${var.p}"
  }
}