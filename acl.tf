#######################################
# VPC ACL
#######################################
resource "aws_default_network_acl" "default_vpc_sentrifugo_ACL" {
  default_network_acl_id = aws_vpc.vpc_sentrifugo.default_network_acl_id

  ingress {
    rule_no    = 100
    protocol   = -1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}