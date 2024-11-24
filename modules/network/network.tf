# Public Subnet Configuration
resource "aws_subnet" "pub_subnets" {
  #count  = 3
  count                   = length(var.pub_subnet_cidrs)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pub_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.pub_azs[count.index]

  tags = {
    Name = "ce7_grp_2_pubsubnet_${(count.index) + 1}"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "pub_RT" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "ce7_grp_2_pub_routetable"
  }
}

# Associating Public Subnets with the Route Table
resource "aws_route_table_association" "pub_RT_assoc" {
  #count          = 3
  count          = length(aws_subnet.pub_subnets)
  subnet_id      = aws_subnet.pub_subnets[count.index].id
  route_table_id = aws_route_table.pub_RT.id
}

# Private Subnet Configuration
resource "aws_subnet" "pvt_subnets" {
  count             = length(var.pvt_subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.pvt_subnet_cidrs[count.index]
  availability_zone = var.pvt_azs[count.index]

  tags = {
    Name = "ce7_grp_2_pvtsub_${count.index + 1}"
  }
}

resource "aws_route_table" "pvt_RT" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "ce7_grp_2_pvt_routetable"
  }
}

resource "aws_route_table_association" "pvt_RT_assoc" {
  count          = length(aws_subnet.pvt_subnets)
  subnet_id      = aws_subnet.pvt_subnets[count.index].id
  route_table_id = aws_route_table.pvt_RT.id
}
