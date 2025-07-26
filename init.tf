provider "aws"{
    region = "ap-northeast-2"
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "cloudwave-terraform-tgw"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
    name = "terraform-lock-tgw"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"

    attribute {
        name = "LockID"
        type = "S"
    }
}
