resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = var.tags
}

resource "aws_subnet" "pubsub" {
  cidr_block = var.pubsub_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = var.tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = var.tags
}
resource "aws_route_table" "mainrt" {
  vpc_id = aws_vpc.main.id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
   }
  tags = var.tags
}

resource "aws_route_table_association" "pubsub_rta" {
  subnet_id = aws_subnet.pubsub.id
  route_table_id = aws_route_table.mainrt.id
}

resource "aws_subnet" "prisub1" {
  cidr_block = var.prisub1_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false
  tags = var.tags
}

resource "aws_subnet" "prisub2" {
  cidr_block = var.prisub2_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = false
  tags = var.tags
}

resource "aws_eip" "nat_eip" {
  #vpc = true
  tags = var.tags
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.pubsub.id
  tags = var.tags
  depends_on = [ aws_internet_gateway.main]
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = var.tags
}

resource "aws_eip" "nat_eip2" {
  #vpc = true
  tags = var.tags
}
resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id = aws_subnet.pubsub.id
  tags = var.tags
  depends_on = [ aws_internet_gateway.main]
}

resource "aws_route_table" "private-rt2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }
  tags = var.tags
}

resource "aws_route_table_association" "private-rt1-assn" {
  subnet_id = aws_subnet.prisub1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rt2-assn" {
  subnet_id = aws_subnet.prisub2.id
  route_table_id = aws_route_table.private-rt2.id
}