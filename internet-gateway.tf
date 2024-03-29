#######################################
# VPC gateway
#######################################
resource "aws_internet_gateway" "base_gateway" {
  vpc_id = aws_vpc.base.id
}


#######################################
# Route table
#######################################
resource "aws_route_table" "base_route_table" {
  vpc_id = aws_vpc.base.id
}

resource "aws_route" "base_route" {
  route_table_id          = aws_route_table.base_route_table.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.base_gateway.id
  depends_on              = [aws_route_table.base_route_table]
}

resource "aws_main_route_table_association" "base_route_table_association" {
  vpc_id         = aws_vpc.base.id
  route_table_id = aws_route_table.base_route_table.id
}