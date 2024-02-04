terraform {
  backend "s3" {
    bucket = "clo835-assignment1"
    key    = "container_registry/terraform.tfstate"
    region = "us-east-1"
  }
}