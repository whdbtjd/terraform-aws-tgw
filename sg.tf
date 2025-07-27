# 보안그룹 생성 및 연결
resource "aws_security_group" "tgw-sg" {
    for_each = {
      "vpc-a" = aws_vpc.vpc-a.id
      "vpc_b" = aws_vpc.vpc-b.id
      "vpc_c" = aws_vpc.vpc-c.id
    }

    name = "tgw-sg"
    vpc_id = each.value
    
    tags = {
        Name = "tgw-sg"
    }
}