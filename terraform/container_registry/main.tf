provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "repositories" {
  count = 2
  name  = count.index == 0 ? "webapp" : "mysqldb"
  tags  = var.default_tags
}