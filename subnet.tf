#######################################
# Public subnet
#######################################
resource "aws_subnet" "base_public_subnet_1" {
  vpc_id                  = aws_vpc.base.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "base_public_subnet_2" {
  vpc_id                  = aws_vpc.base.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}


#######################################
# Private subnet
#######################################
resource "aws_subnet" "base_private_subnet_1" {
  vpc_id     = aws_vpc.base.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "base_private_subnet_2" {
  vpc_id     = aws_vpc.base.id
  cidr_block = "10.0.3.0/24"
}