resource "aws_vpc" "vpc-a" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-a" {
    vpc_id = aws_vpc.vpc-a.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_vpc" "vpc-b" {
    cidr_block = "172.16.0.0/16"
}

resource "aws_vpc" "vpc-c" {
    cidr_block = "192.168.0.0/16"
}