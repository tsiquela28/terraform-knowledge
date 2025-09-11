resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.network.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.network.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "route-table-terraform"
  }
}

resource "aws_route_table_association" "route_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route.id
}

resource "aws_security_group" "sgdefault" {
  name        = "security-group-default"
  description = "SG Padrao"
  vpc_id      = aws_vpc.network.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Saida rede"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group-terraform"
  }
}
