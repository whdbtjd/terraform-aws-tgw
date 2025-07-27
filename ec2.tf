# tf파일 전역에서 사용할 맵 변수
locals {
  subnet_ids = {
    "vpc_a" = aws_subnet.subnet-a.id
    "vpc_b" = aws_subnet.subnet-b.id
    "vpc_c" = aws_subnet.subnet-c.id
  }
}

# ec2 접속용 키페어
resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/my-key.pub")
}

# Amazon Linux의 최신 이미지 정보 가져오기
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# 인스턴스 생성
resource "aws_instance" "ec2-tgw" {
  for_each = {
    "vpc_a" = aws_vpc.vpc-a.id
    "vpc_b" = aws_vpc.vpc-b.id
    "vpc_c" = aws_vpc.vpc-c.id
  }

  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  associate_public_ip_address = each.key == "vpc_a" ? true : false
  subnet_id                   = local.subnet_ids[each.key]
  key_name                    = aws_key_pair.ec2-key.key_name
  vpc_security_group_ids      = [aws_security_group.tgw_sg[each.key].id]

  tags = {
    Name = "web-server-${each.key}"
  }
}
