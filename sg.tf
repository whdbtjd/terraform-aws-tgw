# 보안그룹 생성 및 연결
resource "aws_security_group" "tgw_sg" {
  for_each = {
    "vpc_a" = aws_vpc.vpc-a.id
    "vpc_b" = aws_vpc.vpc-b.id
    "vpc_c" = aws_vpc.vpc-c.id
  }

  name   = "tgw-sg-${each.key}"
  vpc_id = each.value

  tags = {
    Name = "tgw-sg"
  }
}

# 보안그룹 인바운드 규칙 정의 (SSH)
resource "aws_vpc_security_group_ingress_rule" "tgw_sg_ingress_ssh" {
  for_each = {
    "vpc_a" = aws_vpc.vpc-a.cidr_block
    "vpc_b" = aws_vpc.vpc-b.cidr_block
    "vpc_c" = aws_vpc.vpc-c.cidr_block
  }

  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  security_group_id = aws_security_group.tgw_sg[each.key].id
  cidr_ipv4         = each.key == "vpc_a" ? "0.0.0.0/0" : each.value
}

# 보안그룹 인바운드 규칙 정의 (ICMP - ping)
resource "aws_vpc_security_group_ingress_rule" "tgw_sg_ingress_icmp" {
  for_each = {
    "vpc_b" = aws_vpc.vpc-b.cidr_block
    "vpc_c" = aws_vpc.vpc-c.cidr_block
  }

  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
  cidr_ipv4         = aws_vpc.vpc-a.cidr_block
  security_group_id = aws_security_group.tgw_sg[each.key].id
}

# 보안그룹 아웃바운드 규칙 정의
resource "aws_vpc_security_group_egress_rule" "tgw_sg_egress_default" {

  for_each = {
    "vpc_a" = aws_vpc.vpc-a.id
    "vpc_b" = aws_vpc.vpc-b.id
    "vpc_c" = aws_vpc.vpc-c.id
  }

  
  security_group_id = aws_security_group.tgw_sg[each.key].id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = -1
  ip_protocol = "icmp"
  to_port     = -1
} 
