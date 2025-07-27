# vpc 생성
resource "aws_vpc" "vpc-a" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-a"
  }
}

resource "aws_vpc" "vpc-b" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc-b"
  }
}

resource "aws_vpc" "vpc-c" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "vpc-c"
  }
}

# 각 vpc에 서브넷 생성
resource "aws_subnet" "subnet-a" {
  vpc_id     = aws_vpc.vpc-a.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-a"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id     = aws_vpc.vpc-b.id
  cidr_block = "172.16.20.0/24"

  tags = {
    Name = "subnet-b"
  }
}

resource "aws_subnet" "subnet-c" {
  vpc_id     = aws_vpc.vpc-c.id
  cidr_block = "192.168.20.0/24"

  tags = {
    Name = "subnet-c"
  }
}

# 각 vpc에 라우팅 테이블 생성
resource "aws_route_table" "rt-a" {
  vpc_id = aws_vpc.vpc-a.id
  
  route {
    cidr_block         = "172.16.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block         =  "192.168.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-a"
  }
}

resource "aws_route_table" "rt-b" {
  vpc_id = aws_vpc.vpc-b.id

  route {
    cidr_block = "192.168.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = "10.0.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "rt-b"
  }
}

resource "aws_route_table" "rt-c" {
  vpc_id = aws_vpc.vpc-c.id

  route {
    cidr_block = "172.16.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = "10.0.0.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "rt-c"
  }
}

# 라우팅 테이블과 서브넷 연결
resource "aws_route_table_association" "rt-sb-a" {
  subnet_id      = aws_subnet.subnet-a.id
  route_table_id = aws_route_table.rt-a.id
}

resource "aws_route_table_association" "rt-sb-b" {
  subnet_id      = aws_subnet.subnet-b.id
  route_table_id = aws_route_table.rt-b.id
}

resource "aws_route_table_association" "rt-sb-c" {
  subnet_id      = aws_subnet.subnet-c.id
  route_table_id = aws_route_table.rt-c.id
}

# igw 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-a.id

  tags = {
    Name = "igw-a"
  }
}
