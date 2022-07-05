#######################################
# VPC gateway
#######################################
resource "aws_internet_gateway" "vpc_sentrifugo_gateway" {
  vpc_id = aws_vpc.vpc_sentrifugo.id
}


#######################################
# Route table
#######################################
resource "aws_route_table" "vpc_sentrifugo_route_table" {
  vpc_id = aws_vpc.vpc_sentrifugo.id
}

resource "aws_route" "vpc_sentrifugo_route" {
  route_table_id          = aws_route_table.vpc_sentrifugo_route_table.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.vpc_sentrifugo_gateway.id
  depends_on              = [aws_route_table.vpc_sentrifugo_route_table]
}

resource "aws_main_route_table_association" "vpc_sentrifugo_route_table_association" {
  vpc_id         = aws_vpc.vpc_sentrifugo.id
  route_table_id = aws_route_table.vpc_sentrifugo_route_table.id
}