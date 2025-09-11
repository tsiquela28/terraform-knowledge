# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "subnet_2" {
  cidr_block = "10.0.1.0/24"
  region     = "sa-east-1"
  tags = {
    Name = "subnet2"
  }
  vpc_id = "vpc-0c0d33171ef7e11af"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet_1" {
  cidr_block = "10.0.0.0/24"
  region     = "sa-east-1"
  tags = {
    Name = "subnet1"
  }
  vpc_id = "vpc-0c0d33171ef7e11af"
}

# __generated__ by Terraform
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  region     = "sa-east-1"
  tags = {
    Name = "vpc-getconfig"
  }
}
