resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "${var.name}-vpc"
    }
}

resource "aws_subnet" "pubsub" {
  cidr_block = var.pubsub_cidr
  vpc_id = aws_vpc.main.id
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pubsub"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.name}-igw"
  }
}
resource "aws_route_table" "mainrt" {
  vpc_id = aws_vpc.main.id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
   }
  tags = {
    Name = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "pubsub_rta" {
  subnet_id = aws_subnet.pubsub.id
  route_table_id = aws_route_table.mainrt.id
}