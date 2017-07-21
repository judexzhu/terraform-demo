variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-a60c23b0"
    us-east-2 = "ami-ae90b6cb"
    us-west-1 = "ami-96f1dcf6"
    us-west-2 = "ami-7646530f"
  }
}
variable "RDS_PASSWORD" { }
