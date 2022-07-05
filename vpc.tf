#######################################
# VPC
#######################################
resource "aws_vpc" "vpc_sentrifugo" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
}
