terraform {
  backend "s3" {
    bucket = "clo835-assignment1"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}