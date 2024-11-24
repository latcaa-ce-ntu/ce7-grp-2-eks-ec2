resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ce7_g2_main_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "ce7_grp_2_igw"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.pub_subnets[0].id # Attach to first public subnet

  tags = {
    Name = "ce7_grp_2_nat_gw"
  }
}


data "aws_vpc" "main_vpc" {
  # Retrieves the details of the created VPC using its ID
  id = aws_vpc.main_vpc.id
}

