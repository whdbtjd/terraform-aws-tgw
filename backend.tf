terraform {
  backend "s3" {
    bucket         = "cloudwave-terraform-tgw"
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-tgw"
  }
}