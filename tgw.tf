# tgw 생성
resource "aws_ec2_transit_gateway" "tgw" {
    description = "tgw"

    tags = {
        Name = "terraform-tgw"
    }
}

# tgw와 서브넷간 명시적 연결
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-vpc-a" {
    subnet_ids         = [aws_subnet.subnet-a.id]
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpc-a.id

    tags = {
        Name = "tgw-vpc-a"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-vpc-b" {
    subnet_ids         = [aws_subnet.subnet-b.id]
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpc-b.id

    tags = {
        Name = "tgw-vpc-b"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-vpc-c" {
    subnet_ids         = [aws_subnet.subnet-c.id]
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpc-c.id

    tags = {
        Name = "tgw-vpc-c"
    }
}