# ec2 접속용 키페어
resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/my-key.pub")
}
