variable "subnet_names" {
  type    = list(string)
  default = ["subnet-a", "subnet-b", "subnet-c"]
}

variable "vpc_names" {
  type    = list(string)
  default = ["vpc-a", "vpc-b", "vpc-c"]  
}
