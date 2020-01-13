resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.env_vpc.id
  cidr_block              = var.public_subnets["az1"]
  availability_zone       = var.env["az"]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env["name"]}-public-${var.env["az"]}"
    env  = var.env["name"]
    TF   = "YES"
  }
}

