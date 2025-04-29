#Acces Internet

resource "aws_eip" "nat" {
  domain = "vpc"  # Indique que l'EIP est pour une VPC
  tags = {
    Name = "YourMedia-NAT-EIP"
  }
}
# Créer une passerelle Internet
resource "aws_internet_gateway" "ym_igw" {
  vpc_id = aws_vpc.ym_vpc.id
  tags = {
    Name = "YourMedia-IGW"
  }
}
# Créer une instance NAT
resource "aws_nat_gateway" "ym_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.ym_pub_subnet.id
  tags = {
    Name = "YourMedia-NAT-Gateway"
  }
  depends_on = [aws_internet_gateway.ym_igw]
}
# Créer une table de routage publique
resource "aws_route_table" "ym_pub_rt" {
  vpc_id = aws_vpc.ym_vpc.id
  tags = { Name = "YourMedia-Public-RT" }
}

resource "aws_route" "ym_pub_route" {
  route_table_id         = aws_route_table.ym_pub_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ym_igw.id
}

resource "aws_route" "ym_route" {
  route_table_id         = aws_route_table.ym_priv_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ym_nat.id  # Utiliser la passerelle NAT pour le trafic sortant
}

resource "aws_route_table_association" "ym_route_table_assoc" {
  subnet_id      = aws_subnet.ym_pub_subnet.id
  route_table_id = aws_route_table.ym_pub_rt.id
}

# Créer une table de routage privée
resource "aws_route_table" "ym_priv_rt" {
  vpc_id = aws_vpc.ym_vpc.id
  tags = { Name = "YourMedia-Private-RT" }
}

# Associer les subnets privés
resource "aws_route_table_association" "ym_priv_rt_assoc" {
  subnet_id      = aws_subnet.ym_priv_subnet.id
  route_table_id = aws_route_table.ym_priv_rt.id
}

