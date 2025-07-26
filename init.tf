provider "aws"{
    region = "ap-northeast-2"
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "cloudwave-terraform-tgw"
}

