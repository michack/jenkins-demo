resource "aws_vpc" "env_vpc" {
  cidr_block           = var.env["vpc_cidr"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.env["name"]}-vpc"
    TF   = "YES"
  }
}

resource "aws_internet_gateway" "env_gw" {
  vpc_id = aws_vpc.env_vpc.id

  tags = {
    Name        = "${var.env["name"]}-gw"
    environment = var.env["name"]
  }
}

resource "aws_route_table" "env_public_rt" {
  vpc_id = aws_vpc.env_vpc.id

  tags = {
    Name = "${var.env["name"]}-public-rt"
    env  = var.env["name"]
    TF   = "YES"
  }
}

resource "aws_route" "env_r_gateway" {
  route_table_id         = aws_route_table.env_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.env_gw.id
}

resource "aws_route_table_association" "env_rta_public_subnets_env_public_rt" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.env_public_rt.id
}

