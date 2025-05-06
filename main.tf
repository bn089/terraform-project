resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "group-3"
  }
}

resource "aws_subnet" "main" {
    count = length(var.subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "group-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "group-3"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

tags = {
    Name = "group-3"
  }
}

resource "aws_route_table_association" "a" {
    count = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.main.id
}



