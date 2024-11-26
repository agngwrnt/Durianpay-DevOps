resource "aws_vpc" "my-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.tags
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = merge(var.tags, { Name = "${var.environment}-public-subnet" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = merge(var.tags, { Name = "${var.environment}-public-route-table" })
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(var.tags, { Name = "${var.environment}-private-subnet" })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat.id
  }

  tags = merge(var.tags, { Name = "${var.environment}-private-route-table" })
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = var.tags
}

resource "aws_nat_gateway" "my-nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = var.tags
}

resource "aws_eip" "nat" {
  vpc = true
}