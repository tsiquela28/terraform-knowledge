resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet" {
  count = 3

  vpc_id     = aws_vpc.network.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${count.index}"
  }
}