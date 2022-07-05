#######################################
# Security group
#######################################
resource "aws_security_group" "base_sg" {
  name        = "base_sg"
  vpc_id      = aws_vpc.base.id
}


#######################################
# Security group rules
#######################################
resource "aws_security_group_rule" "egress_traffic" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.base_sg.id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.base.cidr_block]
  ipv6_cidr_blocks  = [aws_vpc.base.ipv6_cidr_block]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.base_sg.id
}

resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.base_sg.id
}

resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  self              = null
  prefix_list_ids   = null
  security_group_id = aws_security_group.base_sg.id
}