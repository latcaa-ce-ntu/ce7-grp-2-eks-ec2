# Main VPC Configuration
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


# Elastic IP Configuration for NAT Gateway
# Allocates a static public IP address that will be used by the NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT Gateway Configuration
# Allows private subnet resources to access the internet while remaining private
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