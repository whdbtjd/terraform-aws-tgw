# vpc생성
resource "aws_vpc" "vpc-a" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "vpc-b" {
    cidr_block = "172.16.0.0/16"
}

resource "aws_vpc" "vpc-c" {
    cidr_block = "192.168.0.0/16"
}

# 각 vpc에 서브넷 생성
resource "aws_subnet" "subnet-a" {
    vpc_id = aws_vpc.vpc-a.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet-b" {
    vpc_id = aws_vpc.vpc-b.id
    cidr_block = "172.16.20.0/24"
}

resource "aws_subnet" "subnet-c" {
    vpc_id = aws_vpc.vpc-c.id
    cidr_block = "192.168.20.0/24"
}

# 각 vpc에 라우팅 테이블 생성
resource "aws_route_table" "rt-a" {
    vpc_id = aws_vpc.vpc-a.id

}

resource "aws_route_table" "rt-b" {
    vpc_id = aws_vpc.vpc-b.id

}

resource "aws_route_table" "rt-c" {
    vpc_id = aws_vpc.vpc-c.id

}

