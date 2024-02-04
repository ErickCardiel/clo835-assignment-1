data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "terraform_remote_state" "network_outputs" {
  backend = "s3"
  config = {
    bucket = "clo835-assignment1"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}