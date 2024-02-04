provider "aws" {
  region = var.region
}


data "aws_vpc" "default" {
  default = true
}


data "aws_subnet" "public" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "${var.region}a"
}